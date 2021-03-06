/*
 * All Video Processing kernels 
 * Copyright © <2010>, Intel Corporation.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sub license, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice (including the
 * next paragraph) shall be included in all copies or substantial portions
 * of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
 * IN NO EVENT SHALL PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR
 * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * This file was originally licensed under the following license
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */

// Module name: PL16x8_PL8x4.asm
//----------------------------------------------------------------

#include "common.inc"

#ifndef DEST_U 	//DEST_U, DEST_V not defined

	#if (nSRC_REGION==nREGION_1)
		#define DEST_Y		uwTOP_Y
		#define DEST_U		uwTOP_U
		#define DEST_V		uwTOP_V
	#elif (nSRC_REGION==nREGION_2)
		#define DEST_Y		uwBOT_Y
		#define DEST_U		uwBOT_U
		#define DEST_V		uwBOT_V
	#endif
	
#endif

//Convert 444 from sampler to 422
$for (0, 0; <8; 2, 1) {
	mov	(8)	DEST_U(0,%2*8)<1>	DEST_U(%1)<16;8,2>
	mov	(8)	DEST_V(0,%2*8)<1>	DEST_V(%1)<16;8,2>	
}

// Re-define new number of lines
#undef nUV_NUM_OF_ROWS
#define nUV_NUM_OF_ROWS     4
