ENTRY(_start)

MEMORY {
	mem : ORIGIN = 0x00000000, LENGTH = 0x00018000
}

SECTIONS {
	.text : {
		start*(.text)
		*(.text)
		*(*)
		. = ALIGN(4);
	} > mem
}
