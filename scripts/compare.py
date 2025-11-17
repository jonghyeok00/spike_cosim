import sys

def normalize_instr(instr):
    instr = ' '.join(instr.strip().lower().split())
    for symbol in ['#', '<']:
        if symbol in instr:
            instr = instr.split(symbol)[0].strip()
    instr = instr.replace(',', ' ')
    tokens = instr.split()
    return ' '.join(tokens)

def normalize_data(data):
    data = data.lower().lstrip('0') or '0'
    return data.zfill(4)

def parse_input1_line(line):
    parts = [p.strip() for p in line.split('|')]
    if len(parts) < 4:
        return None
    addr = parts[1].lower()
    data = normalize_data(parts[2].lower())
    instr = normalize_instr(parts[3])
    return (addr, data, instr)

def parse_input2_line(line):
    parts = [p.strip() for p in line.split('|')]
    if len(parts) < 3:
        return None
    addr = parts[0].lower()
    data = normalize_data(parts[1].lower())
    instr = normalize_instr(parts[2])
    return (addr, data, instr)

def is_equivalent(instr1, instr2):
    def tokenize(instr):
        instr = instr.replace(',', ' ')
        return instr.strip().lower().split()

    tokens1 = tokenize(instr1)
    tokens2 = tokenize(instr2)

    if tokens1 == tokens2:
        return True

    if not tokens1 or not tokens2:
        return False

    op1, *args1 = tokens1
    op2, *args2 = tokens2

    base_op1 = op1[2:] if op1.startswith('c.') else op1
    base_op2 = op2[2:] if op2.startswith('c.') else op2

    if base_op1 != base_op2:
        return False

    # exactly correct
    if len(args1) == len(args2) and args1 == args2:
        return True

    # repeated args
    if op1.startswith('c.') or op2.startswith('c.'):
        if len(args1) == 2 and len(args2) == 3:
            if args1[0] == args2[0] == args2[1] and args1[1] == args2[2]:
                return True
        if len(args2) == 2 and len(args1) == 3:
            if args2[0] == args1[0] == args1[1] and args2[1] == args1[2]:
                return True

    return False

def compare_files(file1_path, file2_path):
    with open(file1_path, 'r') as f1, open(file2_path, 'r') as f2:
        lines1 = f1.readlines()[1:]
        lines2 = f2.readlines()[5:]

    input1_items = []
    for idx, line in enumerate(lines1):
        parsed = parse_input1_line(line)
        if parsed:
            addr, data, instr = parsed
            input1_items.append((idx + 2, (addr, data, instr)))

    input2_items = []
    for line in lines2:
        parsed = parse_input2_line(line)
        if parsed:
            addr, data, instr = parsed
            input2_items.append((addr, data, instr))

    total = len(input1_items)
    pass_count = 0
    fail_lines = []

    for lineno, (addr1, data1, instr1) in input1_items:
        found = any(
            addr1 == addr2 and data1 == data2 and is_equivalent(instr1, instr2)
            for (addr2, data2, instr2) in input2_items
        )
        if found:
            pass_count += 1
        else:
            fail_lines.append(lineno)

    fail_count = total - pass_count

    print(f"TOTAL LINES: {total}")
    print(f"PASSED LINES: {pass_count}")
    print(f"FAILED LINES: {fail_count}")
    if fail_lines:
        print("FAILED LINES NUM:", ', '.join(map(str, fail_lines)))
    print("PASS" if fail_count == 0 else "FAIL")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("rule: python3 compare.py input1.txt converted_input2.txt")
        sys.exit(1)

    input_file = sys.argv[1]
    converted_file = sys.argv[2]
    compare_files(input_file, converted_file)
