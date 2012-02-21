	org 32768
__START_PROGRAM:
	di
	push ix
	push iy
	exx
	push hl
	exx
	ld hl, 0
	add hl, sp
	ld (__CALL_BACK__), hl
	ei
	ld hl, _gridcopy + 3
	push hl
	ld hl, _grid + 3
	push hl
	ld hl, 5
	ld b, h
	ld c, l
	ld hl, (_grid)
	ld de, (_gridcopy)
	ldir
	ld a, (_grid + 3)
	ld (_a), a
	ld hl, _gridcopy + 3
	push hl
	ld hl, _grid + 3
	push hl
	ld hl, 5
	ld b, h
	ld c, l
	ld hl, (_grid)
	ld de, (_gridcopy)
	ldir
	ld hl, 0
	ld b, h
	ld c, l
__END_PROGRAM:
	di
	ld hl, (__CALL_BACK__)
	ld sp, hl
	exx
	pop hl
	exx
	pop iy
	pop ix
	ei
	ret
__CALL_BACK__:
	DEFW 0
	
ZXBASIC_USER_DATA:
_a:
	DEFB 00
_grid:
	DEFW 0000h
	DEFB 01h
	DEFB 00h
	DEFB 01h
	DEFB 02h
	DEFB 03h
	DEFB 04h
_gridcopy:
	DEFW 0000h
	DEFB 01h
	DEFB 00h
	DEFB 00h
	DEFB 00h
	DEFB 00h
	DEFB 00h
	; Defines DATA END --> HEAP size is 0
ZXBASIC_USER_DATA_END EQU ZXBASIC_MEM_HEAP
	; Defines USER DATA Length in bytes
ZXBASIC_USER_DATA_LEN EQU ZXBASIC_USER_DATA_END - ZXBASIC_USER_DATA
	END
