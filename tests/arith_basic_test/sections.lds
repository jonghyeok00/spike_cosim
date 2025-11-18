ENTRY(_start)

MEMORY {
	mem : ORIGIN = 0x00000000, LENGTH = 0x00018000
}

SECTIONS {
	.memory : {
		. = 0x00000000;
		start*(.text);
		*(.text);
		*(*);
		end = .;
		. = ALIGN(4);
	} > mem
}
