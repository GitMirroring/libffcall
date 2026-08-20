/* Trampoline for arm64 CPU with arm64-ms ABI */

/*
 * Copyright 2017-2026 Bruno Haible <bruno@clisp.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

/* Available registers: x9, ..., x17. */

	.cpu generic+fp+simd
	.text

	.align	2
	.p2align 3,,7
	.global	tramp
	.type	tramp, %function
tramp:
	ldr	x16, .+24	/* get <function> */
	ldr	x17, .+12	/* get <data> */
	br	x16		/* jump to <function> */
	nop			/* for alignment */
data:
	.xword 0x7355471143622155
function:
	.xword 0xbabebec0dea0ffab
	.size	tramp, .-tramp
