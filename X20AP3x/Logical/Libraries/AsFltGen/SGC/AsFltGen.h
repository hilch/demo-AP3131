/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASFLTGEN_
#define _ASFLTGEN_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _IEC_CONST
#define _IEC_CONST _WEAK const
#endif

/* Constants */
#ifdef _REPLACE_CONST
 #define fltMODE_SYNCHRON 128U
 #define fltMODE_ASYNCHRON 256U
 #define fltMODE_PACKET 262144U
 #define fltMODE_FRAME 131072U
 #define fltMODE_STREAM 65536U
 #define fltERR_FRAME_FINISHED 33809U
 #define fltERR_CFG_INVALID 33808U
 #define fltERR_SEQUIN_INVALID 33807U
 #define fltERR_MTU_INVALID 33806U
 #define fltERR_FIFO_OVERRUN 33805U
 #define fltERR_BUF_SMALL 33803U
 #define fltERR_BUF_INVALID 33802U
 #define fltERR_BUF_WRONG 33801U
 #define fltERR_SYNC 33800U
#else
 _IEC_CONST unsigned long fltMODE_SYNCHRON = 128U;
 _IEC_CONST unsigned long fltMODE_ASYNCHRON = 256U;
 _IEC_CONST unsigned long fltMODE_PACKET = 262144U;
 _IEC_CONST unsigned long fltMODE_FRAME = 131072U;
 _IEC_CONST unsigned long fltMODE_STREAM = 65536U;
 _IEC_CONST unsigned short fltERR_FRAME_FINISHED = 33809U;
 _IEC_CONST unsigned short fltERR_CFG_INVALID = 33808U;
 _IEC_CONST unsigned short fltERR_SEQUIN_INVALID = 33807U;
 _IEC_CONST unsigned short fltERR_MTU_INVALID = 33806U;
 _IEC_CONST unsigned short fltERR_FIFO_OVERRUN = 33805U;
 _IEC_CONST unsigned short fltERR_BUF_SMALL = 33803U;
 _IEC_CONST unsigned short fltERR_BUF_INVALID = 33802U;
 _IEC_CONST unsigned short fltERR_BUF_WRONG = 33801U;
 _IEC_CONST unsigned short fltERR_SYNC = 33800U;
#endif




/* Datatypes and datatypes of function blocks */
typedef enum fltSync_t
{	fltSYNC_INC_DONE,
	fltSYNC_ACT_MTU_WRITTEN,
	fltSYNC_INC_NEXT_CYC
} fltSync_t;

typedef struct fltRxBuf_t
{	unsigned char bufContent[64];
	unsigned char buf[128];
	unsigned char top;
	unsigned char end;
	unsigned char hidden;
	unsigned char frames;
} fltRxBuf_t;

typedef struct fltRx_t
{	unsigned long pMtu;
	signed short mtuSize;
	struct fltRxBuf_t recvBuf;
	signed short conn;
	signed short segSize;
	signed short segFlgs;
	signed char sequOut;
	unsigned char cnt;
	unsigned long flgs;
	unsigned long usrBufOffs;
	unsigned long usrBufPointer;
} fltRx_t;

typedef struct fltTxRequ_t
{	unsigned long doneBytes;
	unsigned long pendBytes;
	unsigned long pBuf;
	unsigned long bufSize;
} fltTxRequ_t;

typedef struct fltTxMtuData_t
{	signed short usedSize;
	signed short rawData;
	signed char sequ;
	unsigned char mtu[27];
} fltTxMtuData_t;

typedef struct fltTx_t
{	signed short mtuSize;
	unsigned long pSequIn;
	unsigned char readSequ;
	unsigned long pMtu;
	signed short conn;
	signed char sequ;
	signed char lastSequ;
	signed char lastAcknSequ;
	unsigned char ctrl;
	unsigned char lock;
	unsigned char runs;
	enum fltSync_t sync;
	struct fltTxRequ_t requ;
	struct fltTxMtuData_t forwMtu[8];
	unsigned long flgs;
} fltTx_t;

typedef struct fltRead
{
	/* VAR_INPUT (analog) */
	unsigned long cfg;
	unsigned long pBuf;
	unsigned short bufLen;
	unsigned long pRxBytes;
	unsigned char rxBytesLen;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned short validBytes;
	unsigned short pendBytes;
	unsigned char readSequ;
	/* VAR (analog) */
	struct fltRx_t _cache;
	/* VAR_INPUT (digital) */
	plcbit enable;
} fltRead_typ;

typedef struct fltWrite
{
	/* VAR_INPUT (analog) */
	unsigned long cfg;
	unsigned long pBuf;
	unsigned short bufLen;
	unsigned char readSequ;
	unsigned long pTxBytes;
	unsigned char txBytesLen;
	unsigned long pSequ;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	struct fltTx_t _cache;
	/* VAR_INPUT (digital) */
	plcbit enable;
} fltWrite_typ;



/* Prototyping of functions and function blocks */
void fltRead(struct fltRead* inst);
void fltWrite(struct fltWrite* inst);


#ifdef __cplusplus
};
#endif
#endif /* _ASFLTGEN_ */

                                                           
