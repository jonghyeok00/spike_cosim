import re
import sys

def normalize_instr(instr):
    return ' '.join(instr.strip().split())

def normalize_data(data):
    data = data.lower().lstrip('0') or '0'
    return data.zfill(8)

def format_shift_immediate(instr):
    shift_ops = ['c.srli', 'srli', 'c.srai', 'srai', 'c.slli', 'slli']
    for op in shift_ops:
        # no rs : c.srli a1, 4
        pattern_no_rs = rf'^({op})\s+(\w+),\s*(-?\d+)$'
        match = re.match(pattern_no_rs, instr)
        if match:
            mnemonic, rd, imm = match.groups()
            return f"{mnemonic} {rd}, 0x{int(imm):x}"

        # rs : srli a1, a2, 4
        pattern_with_rs = rf'^({op})\s+(\w+),\s*(\w+),\s*(-?\d+)$'
        match = re.match(pattern_with_rs, instr)
        if match:
            mnemonic, rd, rs, imm = match.groups()
            return f"{mnemonic} {rd}, {rs}, 0x{int(imm):x}"

    return instr

def convert_pseudo_instructions(instr):
    # slt rd, zero, rs → sgtz rd, rs
    match_sgtz = re.match(r'^slt\s+(\w+),\s*zero,\s*(\w+)$', instr)
    if match_sgtz:
        rd, rs = match_sgtz.groups()
        return f"sgtz {rd}, {rs}"

    # slt rd, rs, zero → sltz rd, rs
    match_sltz = re.match(r'^slt\s+(\w+),\s*(\w+),\s*zero$', instr)
    if match_sltz:
        rd, rs = match_sltz.groups()
        return f"sltz {rd}, {rs}"

    # sub rd, zero, rs → neg rd, rs
    match_neg = re.match(r'^sub\s+(\w+),\s*zero,\s*(\w+)$', instr)
    if match_neg:
        rd, rs = match_neg.groups()
        return f"neg {rd}, {rs}"

    return instr

def parse_input2_line(line):
    match = re.search(r'core\s+0:\s+0x([0-9a-fA-F]{8})\s*\(0x([0-9a-fA-F]{8})\)\s*(.+)', line)
    if not match:
        return None
    addr_hex, data_hex, instr = match.groups()

    if addr_hex.lower().startswith('80'):
        return None

    addr = addr_hex.lower()
    data = normalize_data(data_hex)
    instr = normalize_instr(instr)

    # instruction exception
    instr = re.sub(r'\bc\.addi4spn\b', 'addi', instr)
    instr = re.sub(r'\bc\.addi16sp\b', 'c.addi', instr)

    # shift immediate
    instr = format_shift_immediate(instr)

    # pseudoinstruction
    instr = convert_pseudo_instructions(instr)

    # jal or c.j operation
    for prefix in ['jal', 'c.j']:
        pattern = rf'{prefix}\s+pc\s*\+\s*0x([0-9a-fA-F]+)'
        match = re.match(pattern, instr)
        if match:
            offset_hex = match.group(1)
            addr_int = int(addr, 16)
            offset_int = int(offset_hex, 16)
            target = addr_int + offset_int
            instr = f"{prefix} {format(target, '04x')}"
            break

    return f"{addr} | {data} | {instr}"

def convert_file(input_path, output_path):
    with open(input_path, 'r') as infile, open(output_path, 'w') as outfile:
        for line in infile:
            parsed = parse_input2_line(line)
            if parsed:
                outfile.write(parsed + '\n')

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("rules: python3 convert.py input.txt output.txt")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]
    convert_file(input_file, output_file)
