# 1 "main.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "main.c"



# 1 "numbers.h" 1
# 14 "numbers.h"
unsigned short numbers[] = {

    0,0,1,1,1,1,0,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,1,1,0,
    0,1,1,0,1,0,1,0,
    0,1,1,1,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,0,0,0,1,0,0,0,
    0,0,1,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,1,1,1,1,0,0,

    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    0,1,0,0,0,0,1,0,
    0,0,0,0,0,1,1,0,
    0,0,0,0,1,1,0,0,
    0,0,0,1,1,0,0,0,
    0,0,1,1,0,0,0,0,
    0,1,1,1,1,1,1,0,

    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    0,1,0,0,0,0,1,0,
    0,0,0,0,0,0,1,0,
    0,0,0,1,1,1,0,0,
    0,0,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,0,0,0,1,1,0,0,
    0,0,0,1,1,1,0,0,
    0,0,1,1,0,1,0,0,
    0,1,1,0,0,1,0,0,
    0,1,1,1,1,1,0,0,
    0,0,0,0,1,1,0,0,
    0,0,0,0,1,1,0,0,
    0,0,0,0,1,1,0,0,

    0,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,0,1,1,1,1,0,0,
    0,0,0,0,0,0,1,0,
    0,1,0,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,0,0,1,1,1,1,0,
    0,0,1,1,1,1,1,0,
    0,1,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,1,1,1,1,0,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,0,
    0,1,0,0,0,1,1,0,
    0,0,0,0,1,1,0,0,
    0,0,0,0,1,1,0,0,
    0,0,0,1,1,0,0,0,
    0,0,0,1,1,0,0,0,
    0,0,1,1,0,0,0,0,

    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,0,0,0,1,0,
    0,0,1,1,1,1,0,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,1,1,1,0,0,

    0,0,1,1,1,1,0,0,
    0,1,1,1,1,1,1,0,
    0,1,1,0,0,0,1,0,
    0,1,1,0,0,0,1,0,
    0,0,1,1,1,1,1,0,
    0,0,0,0,0,1,1,0,
    0,0,0,0,0,1,1,0,
    0,0,0,0,0,1,1,0,
};
# 5 "main.c" 2
# 1 "gba.h" 1







typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef signed char s8;
typedef signed short s16;
typedef signed int s32;

typedef unsigned char byte;
typedef unsigned short hword;
typedef unsigned int word;
# 211 "gba.h"
enum
{
    VBLANK_HANDLER,
    HBLANK_HANDLER,
    VCOUNT_HANDLER,
    TIMER0_HANDLER,
    TIMER1_HANDLER,
    TIMER2_HANDLER,
    TIMER3_HANDLER,
    SERIAL_COM_HANDLER,
    DMA0_HANDLER,
    DMA1_HANDLER,
    DMA2_HANDLER,
    DMA3_HANDLER,
    KEYS_HANDLER,
    CART_HANDLER,
    MAX_INTERRUPT_HANDLERS,
};
# 267 "gba.h"
typedef void (*fp)(void);
# 6 "main.c" 2
# 1 "tetrimino.h" 1
# 10 "tetrimino.h"
int nullTetrimino[4][4] = {
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0},
    {0, 0, 0, 0}
};






const int tetriminos[7][4][4][4] = {

{
    {
        {0, 0, 0, 0},
        {1, 1, 1, 1},
        {0, 0, 0, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 0, 1, 0},
        {0, 0, 1, 0},
        {0, 0, 1, 0},
        {0, 0, 1, 0}
    },
    {
        {0, 0, 0, 0},
        {0, 0, 0, 0},
        {1, 1, 1, 1},
        {0, 0, 0, 0}
    },
    {
        {0, 1, 0, 0},
        {0, 1, 0, 0},
        {0, 1, 0, 0},
        {0, 1, 0, 0}
    }
},


{
    {
        {0, 0, 0, 0},
        {2, 2, 2, 0},
        {0, 2, 0, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 2, 0, 0},
        {2, 2, 0, 0},
        {0, 2, 0, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 2, 0, 0},
        {2, 2, 2, 0},
        {0, 0, 0, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 2, 0, 0},
        {0, 2, 2, 0},
        {0, 2, 0, 0},
        {0, 0, 0, 0}
    }
},


{
    {
        {3, 3, 0, 0},
        {0, 3, 3, 0},
        {0, 0, 0, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 0, 3, 0},
        {0, 3, 3, 0},
        {0, 3, 0, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 0, 0, 0},
        {3, 3, 0, 0},
        {0, 3, 3, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 3, 0, 0},
        {3, 3, 0, 0},
        {3, 0, 0, 0},
        {0, 0, 0, 0}
    }
},


{
    {
        {0, 4, 4, 0},
        {4, 4, 0, 0},
        {0, 0, 0, 0},
        {0, 0, 0, 0}
    }
    ,{
        {0, 4, 0, 0},
        {0, 4, 4, 0},
        {0, 0, 4, 0},
        {0, 0, 0, 0}
    }
    ,{
        {0, 0, 0, 0},
        {0, 4, 4, 0},
        {4, 4, 0, 0},
        {0, 0, 0, 0}
    },
    {
        {4, 0, 0, 0},
        {4, 4, 0, 0},
        {0, 4, 0, 0},
        {0, 0, 0, 0}
    }
},


{
    {
        {0, 0, 0, 0},
        {5, 5, 5, 0},
        {5, 0, 0, 0},
        {0, 0, 0, 0}
    },
    {
        {5, 5, 0, 0},
        {0, 5, 0, 0},
        {0, 5, 0, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 0, 5, 0},
        {5, 5, 5, 0},
        {0, 0, 0, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 5, 0, 0},
        {0, 5, 0, 0},
        {0, 5, 5, 0},
        {0, 0, 0, 0}
    }
},


{
    {
        {6, 0, 0, 0},
        {6, 6, 6, 0},
        {0, 0, 0, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 6, 6, 0},
        {0, 6, 0, 0},
        {0, 6, 0, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 0, 0, 0},
        {6, 6, 6, 0},
        {0, 0, 6, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 6, 0, 0},
        {0, 6, 0, 0},
        {6, 6, 0, 0},
        {0, 0, 0, 0}
    }
},


{
    {
        {0, 0, 0, 0},
        {0, 7, 7, 0},
        {0, 7, 7, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 0, 0, 0},
        {0, 7, 7, 0},
        {0, 7, 7, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 0, 0, 0},
        {0, 7, 7, 0},
        {0, 7, 7, 0},
        {0, 0, 0, 0}
    },
    {
        {0, 0, 0, 0},
        {0, 7, 7, 0},
        {0, 7, 7, 0},
        {0, 0, 0, 0}
    }
}
};
# 7 "main.c" 2
# 1 "background.h" 1

# 1 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 1 3 4
# 10 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/_ansi.h" 1 3 4
# 15 "/usr/local/arm-thumb-elf/sys-include/_ansi.h" 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/newlib.h" 1 3 4
# 16 "/usr/local/arm-thumb-elf/sys-include/_ansi.h" 2 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/sys/config.h" 1 3 4



# 1 "/usr/local/arm-thumb-elf/sys-include/machine/ieeefp.h" 1 3 4
# 5 "/usr/local/arm-thumb-elf/sys-include/sys/config.h" 2 3 4
# 17 "/usr/local/arm-thumb-elf/sys-include/_ansi.h" 2 3 4
# 11 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 2 3 4



# 1 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 1 3 4
# 213 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 325 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 3 4
typedef int wchar_t;
# 15 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 2 3 4

# 1 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 1 3 4
# 14 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/sys/_types.h" 1 3 4
# 12 "/usr/local/arm-thumb-elf/sys-include/sys/_types.h" 3 4
typedef long _off_t;
__extension__ typedef long long _off64_t;


typedef int _ssize_t;





# 1 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 1 3 4
# 354 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 23 "/usr/local/arm-thumb-elf/sys-include/sys/_types.h" 2 3 4


typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;

typedef int _flock_t;
# 15 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 2 3 4




typedef unsigned long __ULong;
# 40 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};
# 68 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct _atexit {
        struct _atexit *_next;
        int _ind;
        void (*_fns[32])(void);
        void *_fnargs[32];
        __ULong _fntypes;
};
# 91 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct __sbuf {
        unsigned char *_base;
        int _size;
};






typedef long _fpos_t;
# 156 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (void * _cookie, char *_buf, int _n);
  int (*_write) (void * _cookie, const char *_buf, int _n);

  _fpos_t (*_seek) (void * _cookie, _fpos_t _offset, int _whence);
  int (*_close) (void * _cookie);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  int _offset;


  struct _reent *_data;



  _flock_t _lock;

};
# 249 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
typedef struct __sFILE __FILE;


struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 280 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 532 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;


  struct _atexit *_atexit;
  struct _atexit _atexit0;


  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 728 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
extern struct _reent *_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 17 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 2 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/machine/stdlib.h" 1 3 4
# 18 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 2 3 4

# 1 "/usr/local/arm-thumb-elf/sys-include/alloca.h" 1 3 4
# 20 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 2 3 4




typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;
# 45 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 3 4
extern int __mb_cur_max;



void abort (void) __attribute__ ((noreturn));
int abs (int);
int atexit (void (*__func)(void));
double atof (const char *__nptr);

float atoff (const char *__nptr);

int atoi (const char *__nptr);
long atol (const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, int (* _compar) (const void *, const void *));




void * calloc (size_t __nmemb, size_t __size);
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((noreturn));
void free (void *);
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);
long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size);
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *, const char *, size_t);
int _mbtowc_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *, const char *, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
size_t wcstombs (char *, const wchar_t *, size_t);
size_t _wcstombs_r (struct _reent *, char *, const wchar_t *, size_t, _mbstate_t *);


int mkstemp (char *);
char * mktemp (char *);


void qsort (void * __base, size_t __nmemb, size_t __size, int(*_compar)(const void *, const void *));
int rand (void);
void * realloc (void * __r, size_t __size);
void srand (unsigned __seed);
double strtod (const char *__n, char **__end_PTR);
double _strtod_r (struct _reent *,const char *__n, char **__end_PTR);
float strtof (const char *__n, char **__end_PTR);






long strtol (const char *__n, char **__end_PTR, int __base);
long _strtol_r (struct _reent *,const char *__n, char **__end_PTR, int __base);
unsigned long strtoul (const char *__n, char **__end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *__n, char **__end_PTR, int __base);

int system (const char *__string);


long a64l (const char *__input);
char * l64a (long __input);
char * _l64a_r (struct _reent *,long __input);
int on_exit (void (*__func)(int, void *),void * __arg);
void _Exit (int __status) __attribute__ ((noreturn));
int putenv (const char *__string);
int _putenv_r (struct _reent *, const char *__string);
int setenv (const char *__string, const char *__value, int __overwrite);
int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);

char * gcvt (double,int,char *);
char * gcvtf (float,int,char *);
char * fcvt (double,int,int *,int *);
char * fcvtf (float,int,int *,int *);
char * ecvt (double,int,int *,int *);
char * ecvtbuf (double, int, int*, int*, char *);
char * fcvtbuf (double, int, int*, int*, char *);
char * ecvtf (float,int,int *,int *);
char * dtoa (double, int, int, int *, int*, char**);
int rand_r (unsigned *__seed);

double drand48 (void);
double _drand48_r (struct _reent *);
double erand48 (unsigned short [3]);
double _erand48_r (struct _reent *, unsigned short [3]);
long jrand48 (unsigned short [3]);
long _jrand48_r (struct _reent *, unsigned short [3]);
void lcong48 (unsigned short [7]);
void _lcong48_r (struct _reent *, unsigned short [7]);
long lrand48 (void);
long _lrand48_r (struct _reent *);
long mrand48 (void);
long _mrand48_r (struct _reent *);
long nrand48 (unsigned short [3]);
long _nrand48_r (struct _reent *, unsigned short [3]);
unsigned short *
       seed48 (unsigned short [3]);
unsigned short *
       _seed48_r (struct _reent *, unsigned short [3]);
void srand48 (long);
void _srand48_r (struct _reent *, long);
long long strtoll (const char *__n, char **__end_PTR, int __base);
long long _strtoll_r (struct _reent *, const char *__n, char **__end_PTR, int __base);
unsigned long long strtoull (const char *__n, char **__end_PTR, int __base);
unsigned long long _strtoull_r (struct _reent *, const char *__n, char **__end_PTR, int __base);


void cfree (void *);
# 172 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 3 4
char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t);
void * _calloc_r (struct _reent *, size_t, size_t);
void _free_r (struct _reent *, void *);
void * _realloc_r (struct _reent *, void *, size_t);
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 213 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 3 4

# 3 "background.h" 2

u16 tile_block[200][8];






void initVram(){

    *(unsigned short*)0x4000000 = 0x0403;
    *(unsigned short*)0x4000004 = 0x0403;

}


u16 blkColors[] = {
    ((0) + (0<<5) + (0<<10)),
    ((0) + (31<<5) + (31<<10)),
    ((31) + (0<<5) + (31<<10)),
    ((31) + (0<<5) + (0<<10)),
    ((16) + (31<<5) + (16<<10)),
    ((31) + (20<<5) + (0<<10)),
    ((0) + (0<<5) + (31<<10)),
    ((31) + (31<<5) + (0<<10)),
};



void drawBlk(int x, int y, u16 color) {
    u16* screen = (u16*)((u16*)0x6000000);
    int screenOffset = y * 240 + x;
    int blockOffset = 0;
    int i = 0;
    int j = 0;
    for (i = 0; i < 8; i++) {
        for (j = 0; j < 8; j++) {
            screen[screenOffset + j] = color;
            blockOffset++;
        }
        screenOffset += 240;
    }
}

void formatInitalBG(){
    int row = 0;
    int col = 0;
    for (row = 0; row < 20; row++) {
        for (col = 0; col < 40; col++) {
            drawBlk(col*8, row*8, blkColors[0]);
        }
    }

}


void drawPlayingField(int playingField[24][10]) {
    int row = 0;
    int col = 0;
    for (row = 4; row < 24; row++) {
        for (col = 0; col < 10; col++) {
            int x = col * 8;
            int y = (row-4) * 8;
            int blockType = playingField[row][col];
            u16 blockColor = blkColors[blockType];
            drawBlk(x, y, blockColor);
        }
    }
}
# 8 "main.c" 2
# 1 "mygbalib.h" 1
# 1 "sprites.h" 1





int palette[] = {
((0) + (0<<5) + (0<<10)),
((31) + (31<<5) + (31<<10)),
((0) + (31<<5) + (31<<10)),
((26) + (26<<5) + (26<<10)),
((9) + (9<<5) + (9<<10)),
((31) + (31<<5) + (0<<10)),
((31) + (0<<5) + (0<<10)),
((0) + (0<<5) + (31<<10)),
((11) + (8<<5) + (3<<10)),
((27) + (27<<5) + (27<<10)),
((16) + (16<<5) + (16<<10)),
((31) + (17<<5) + (17<<10)),
((31) + (24<<5) + (24<<10)),
((27) + (0<<5) + (0<<10)),
((0) + (16<<5) + (0<<10)),
((0) + (31<<5) + (0<<10)),
((16) + (31<<5) + (16<<10)),
((23) + (31<<5) + (23<<10))
};




u16 sprites[] = {


0,0,0,0,0,0,1,1,
0,0,0,0,0,1,1,2,
0,0,0,0,0,1,2,2,
0,0,0,3,0,0,1,1,
0,0,3,3,3,1,1,1,
0,0,3,3,3,1,1,1,
0,0,3,3,3,1,1,1,
0,4,3,4,3,1,1,1,

1,0,0,0,0,0,0,0,
2,0,0,0,0,0,0,0,
2,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,1,1,3,0,0,0,0,
0,0,0,0,0,0,0,0,

0,4,3,4,3,1,1,1,
0,0,0,0,0,1,1,1,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,3,1,1,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,1,1,
0,0,0,0,0,1,1,2,
0,0,0,0,0,1,2,2,
0,0,0,3,0,0,1,1,
0,0,3,3,3,1,1,1,
0,0,3,3,3,1,1,1,
0,0,3,3,3,1,1,1,
0,4,3,4,3,1,1,1,

1,0,0,0,0,0,0,0,
2,0,0,0,0,0,0,0,
2,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,1,1,3,0,0,0,0,
0,0,0,0,0,0,0,0,

0,4,3,4,3,1,1,1,
0,0,5,6,5,1,1,1,
0,0,5,6,5,1,1,0,
0,0,0,5,0,1,1,0,
0,0,0,5,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,3,1,1,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,2,
0,0,0,0,0,0,0,2,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,1,
0,0,0,0,3,1,1,1,
0,0,0,0,0,0,0,0,

1,1,0,0,0,0,0,0,
2,1,1,0,0,0,0,0,
2,2,1,0,0,0,0,0,
1,1,0,0,3,0,0,0,
1,1,1,3,3,3,0,0,
1,1,1,3,3,3,0,0,
1,1,1,3,3,3,0,0,
1,1,1,3,4,3,4,0,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,

1,1,1,3,4,3,4,0,
1,1,1,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,1,1,0,0,0,0,0,
1,1,3,0,0,0,0,0,



0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,2,
0,0,0,0,0,0,0,2,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,1,
0,0,0,0,3,1,1,1,
0,0,0,0,0,0,0,0,

1,1,0,0,0,0,0,0,
2,1,1,0,0,0,0,0,
2,2,1,0,0,0,0,0,
1,1,0,0,3,0,0,0,
1,1,1,3,3,3,0,0,
1,1,1,3,3,3,0,0,
1,1,1,3,3,3,0,0,
1,1,1,3,4,3,4,0,

0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,

1,1,1,3,4,3,4,0,
1,1,1,5,6,5,0,0,
0,1,1,5,6,5,0,0,
0,1,1,0,5,0,0,0,
0,1,1,0,5,0,0,0,
0,1,1,0,0,0,0,0,
0,1,1,0,0,0,0,0,
1,1,3,0,0,0,0,0,



1,1,1,1,1,1,1,1,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,


1,1,1,1,1,1,1,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,


1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,1,1,1,1,1,1,1,


0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,1,1,1,1,1,




1,1,1,1,1,1,1,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,


1,1,1,1,1,1,1,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,


0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,1,1,1,1,1,


0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,1,1,1,1,1,




1,1,1,1,1,1,1,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,


1,1,1,1,1,1,1,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,


0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,1,1,1,1,1,


0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
1,1,1,1,1,1,1,1,



1,1,1,1,1,1,1,1,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,


1,1,1,1,1,1,1,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,


1,1,1,1,1,1,1,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,


1,1,1,1,1,1,1,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,




1,1,1,1,1,1,1,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,


1,1,1,1,1,1,1,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,1,


1,1,1,1,1,1,1,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,


1,1,1,1,1,1,1,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,




0,0,0,0,0,0,0,0,
0,0,0,6,6,6,0,0,
0,0,6,12,12,11,6,0,
0,6,12,11,11,6,6,6,
0,6,12,11,6,6,6,6,
0,6,12,11,6,6,6,6,
0,0,6,12,11,6,6,6,
0,0,0,6,12,11,6,6,


0,0,0,0,0,0,0,0,
0,0,6,6,6,0,0,0,
0,6,12,12,11,6,0,0,
6,12,11,6,6,6,6,0,
6,11,11,6,6,6,6,0,
6,6,6,6,6,6,6,0,
6,6,6,6,6,6,0,0,
6,6,6,6,6,0,0,0,


0,0,0,6,12,11,6,6,
0,0,0,0,6,12,6,6,
0,0,0,0,6,12,11,6,
0,0,0,0,0,6,11,6,
0,0,0,0,0,0,6,6,
0,0,0,0,0,0,6,6,
0,0,0,0,0,0,0,6,
0,0,0,0,0,0,0,0,



6,6,6,6,6,0,0,0,
6,6,6,6,0,0,0,0,
6,6,6,0,0,0,0,0,
6,6,6,0,0,0,0,0,
6,6,0,0,0,0,0,0,
6,6,0,0,0,0,0,0,
6,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,




0,0,0,0,0,0,0,0,
0,0,0,3,3,3,0,0,
0,0,3,4,4,10,3,0,
0,3,4,10,10,3,3,3,
0,3,4,10,3,3,3,3,
0,3,4,10,3,3,3,3,
0,0,3,4,10,3,3,3,
0,0,0,3,4,10,3,3,


0,0,0,0,0,0,0,0,
0,0,3,3,3,0,0,0,
0,3,4,4,10,3,0,0,
3,4,10,3,3,3,3,0,
3,10,10,3,3,3,3,0,
3,3,3,3,3,3,3,0,
3,3,3,3,3,3,0,0,
3,3,3,3,3,0,0,0,


0,0,0,3,4,10,3,3,
0,0,0,0,3,4,3,3,
0,0,0,0,3,4,10,3,
0,0,0,0,0,3,10,3,
0,0,0,0,0,0,3,3,
0,0,0,0,0,0,3,3,
0,0,0,0,0,0,0,3,
0,0,0,0,0,0,0,0,



3,3,3,3,3,0,0,0,
3,3,3,3,0,0,0,0,
3,3,3,0,0,0,0,0,
3,3,3,0,0,0,0,0,
3,3,0,0,0,0,0,0,
3,3,0,0,0,0,0,0,
3,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,




0,0,0,0,0,0,0,0,
0,0,0,14,14,15,0,0,
0,0,14,15,15,17,15,0,
0,14,15,17,15,17,17,15,
0,14,15,15,17,17,17,17,
0,14,15,17,15,17,17,17,
0,14,15,17,17,17,17,17,
0,14,15,15,15,17,17,17,


0,0,0,0,0,0,0,0,
0,0,16,16,16,0,0,0,
0,16,16,17,16,16,0,0,
15,16,17,16,17,16,16,0,
17,17,17,16,17,16,16,0,
17,17,17,17,16,17,16,0,
17,17,17,17,17,16,16,0,
17,17,17,17,16,17,16,0,


0,0,14,15,17,15,17,17,
0,0,0,14,15,15,15,17,
0,0,0,0,14,15,17,15,
0,0,0,0,0,14,15,15,
0,0,0,0,0,0,14,15,
0,0,0,0,0,0,0,14,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,


17,17,17,16,17,16,0,0,
17,17,16,17,16,0,0,0,
17,16,17,16,0,0,0,0,
16,17,16,0,0,0,0,0,
17,16,0,0,0,0,0,0,
16,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,




0,0,0,0,0,6,6,6,
0,0,0,0,0,6,6,6,
0,0,0,0,13,6,6,13,
0,0,0,13,13,13,6,13,
0,0,0,13,13,13,6,13,
0,0,13,13,13,13,6,13,
0,0,13,13,13,13,6,13,
0,6,13,13,13,0,0,13,


6,6,6,0,0,0,0,0,
6,6,6,0,0,0,0,0,
13,6,6,13,0,0,0,0,
13,6,13,13,13,0,0,0,
13,6,13,13,13,0,0,0,
13,6,13,13,13,13,0,0,
13,6,13,13,13,13,0,0,
13,0,0,13,13,13,6,0,


0,6,13,13,0,0,0,13,
0,6,6,13,0,0,0,13,
0,6,6,13,0,0,0,6,
0,6,6,13,0,0,0,6,
6,6,6,6,0,0,6,6,
6,6,6,6,0,0,6,6,
6,6,6,6,0,0,6,6,
0,6,6,0,0,0,0,6,


13,0,0,13,13,13,6,0,
6,0,0,0,13,6,6,0,
6,0,0,0,13,6,6,0,
6,0,0,0,13,6,6,0,
6,6,0,0,6,6,6,6,
6,6,0,0,6,6,6,6,
6,6,0,0,6,6,6,6,
6,0,0,0,0,6,6,0,




0,0,0,1,1,1,6,6,
0,0,0,1,1,1,6,6,
0,0,0,1,1,1,6,6,
0,0,0,1,1,1,6,6,
0,0,0,1,1,1,6,6,
0,0,0,6,6,6,1,1,
0,0,0,6,6,6,1,1,
0,0,0,0,6,6,1,1,


6,1,1,1,6,0,0,0,
6,1,1,1,6,0,0,0,
6,1,1,1,6,0,0,0,
6,1,1,1,6,0,0,0,
6,1,1,1,6,0,0,0,
1,6,6,6,6,0,0,0,
1,6,6,6,6,0,0,0,
1,6,6,6,0,0,0,0,


0,0,0,0,6,6,1,1,
0,0,0,0,6,6,1,1,
0,0,0,0,1,1,6,6,
0,0,0,0,0,1,6,6,
0,0,0,0,0,1,6,6,
0,0,0,0,0,1,6,6,
0,0,0,0,0,1,6,6,
0,0,0,0,0,6,6,6,


1,6,6,6,0,0,0,0,
1,6,6,6,0,0,0,0,
6,1,1,1,0,0,0,0,
6,1,1,0,0,0,0,0,
6,1,1,0,0,0,0,0,
6,1,1,0,0,0,0,0,
6,1,1,0,0,0,0,0,
6,6,6,0,0,0,0,0,




0,0,0,0,0,0,0,6,
0,0,0,0,0,0,6,6,
0,0,0,0,0,0,6,6,
0,0,0,0,0,6,6,6,
0,0,0,0,0,6,6,6,
0,0,0,0,0,6,6,6,
0,0,0,0,0,1,6,6,
0,0,0,0,1,1,6,6,


6,0,0,0,0,0,0,0,
6,6,0,0,0,0,0,0,
6,6,0,0,0,0,0,0,
6,6,6,0,0,0,0,0,
6,6,6,0,0,0,0,0,
6,6,6,0,0,0,0,0,
6,1,1,0,0,0,0,0,
6,1,1,1,0,0,0,0,


0,0,0,0,1,1,6,6,
0,0,0,0,1,1,6,6,
0,0,0,0,1,1,6,6,
0,0,0,0,6,6,1,1,
0,0,0,6,6,6,1,1,
0,0,0,6,6,6,1,1,
0,0,0,6,6,6,1,1,
0,0,0,6,6,6,1,1,


6,1,1,1,0,0,0,0,
6,1,1,1,0,0,0,0,
6,1,1,1,0,0,0,0,
1,6,6,6,0,0,0,0,
1,6,6,6,6,0,0,0,
1,6,6,6,6,0,0,0,
1,6,6,6,6,0,0,0,
1,6,6,6,6,0,0,0,




0,0,1,1,7,7,7,1,
0,0,1,1,7,7,7,1,
0,0,6,1,7,7,7,1,
0,0,6,1,7,7,7,1,
0,0,1,1,7,7,7,1,
0,0,3,1,7,7,7,3,
0,4,1,3,7,7,7,3,
0,4,1,3,7,7,4,1,


1,1,1,7,7,7,0,0,
6,1,1,7,7,7,0,0,
6,6,1,7,7,7,0,0,
6,6,1,7,7,7,0,0,
1,1,1,7,7,7,0,0,
1,1,1,7,7,3,0,0,
3,1,1,7,4,1,3,0,
1,3,1,7,4,1,3,0,


0,4,4,1,3,7,4,1,
1,1,4,1,3,7,4,1,
1,1,1,4,3,7,4,1,
0,4,4,4,0,0,4,4,
0,0,0,8,0,0,0,8,
0,0,8,8,0,0,0,8,
0,8,8,8,8,0,8,8,
0,8,8,8,8,0,8,8,


1,3,1,4,1,4,3,0,
1,3,1,4,1,4,1,3,
1,3,1,4,4,1,1,3,
4,4,0,0,4,4,4,0,
8,0,0,0,8,0,0,0,
8,0,0,0,8,8,0,0,
8,8,0,8,8,8,8,0,
8,8,0,8,8,8,8,0,




0,0,3,3,3,3,3,3,
0,0,1,1,3,1,1,1,
0,0,1,1,3,1,1,1,
0,0,3,3,3,3,3,3,
0,0,1,1,3,1,1,1,
0,0,7,7,7,7,7,7,
0,0,7,7,7,7,7,7,
0,0,1,1,7,7,7,1,


3,3,3,3,3,3,0,0,
1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,
3,3,3,3,3,3,0,0,
1,1,1,1,1,1,0,0,
7,7,7,7,7,7,0,0,
7,7,7,7,7,7,0,0,
1,1,1,7,7,7,0,0,


0,0,1,1,7,7,7,1,
0,0,6,1,7,7,7,1,
0,0,6,1,7,7,7,1,
0,0,6,1,7,7,7,1,
0,0,1,1,7,7,7,1,
0,0,6,1,7,7,7,1,
0,0,6,1,7,7,7,1,
0,0,6,1,7,7,7,1,


1,1,1,7,7,7,0,0,
6,6,1,7,7,7,0,0,
6,6,1,7,7,7,0,0,
6,6,1,7,7,7,0,0,
1,1,1,7,7,7,0,0,
6,6,1,7,7,7,0,0,
6,6,1,7,7,7,0,0,
1,6,1,7,7,7,0,0,




0,0,7,7,7,7,7,7,
0,0,7,7,7,7,7,7,
0,0,1,1,7,7,7,1,
0,0,1,1,7,7,7,1,
0,0,6,1,7,7,7,1,
0,0,6,1,7,7,7,1,
0,0,6,1,7,7,7,1,
0,0,1,1,7,7,7,1,


7,7,7,7,7,7,0,0,
7,7,7,7,7,7,0,0,
1,1,1,7,7,7,0,0,
1,1,1,7,7,7,0,0,
6,6,1,7,7,7,0,0,
6,6,1,7,7,7,0,0,
6,6,1,7,7,7,0,0,
1,1,1,7,7,7,0,0,


0,0,6,1,7,7,7,1,
0,0,6,1,7,7,7,1,
0,0,1,1,3,1,1,1,
0,0,1,1,3,1,1,1,
0,0,3,3,3,3,3,3,
0,0,6,1,3,1,1,7,
0,0,1,1,3,1,1,7,
0,0,6,1,3,1,1,6,


6,6,1,7,7,7,0,0,
6,6,1,7,7,7,0,0,
1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,
3,3,3,3,3,3,0,0,
7,6,6,1,1,1,0,0,
7,1,1,1,1,1,0,0,
6,6,6,1,1,1,0,0,




0,0,1,1,1,1,1,1,
0,0,1,1,1,6,1,1,
0,0,1,1,1,1,1,1,
0,0,1,1,1,1,1,1,
0,0,1,1,1,6,1,1,
0,0,3,3,3,6,3,3,
0,0,1,1,1,1,1,1,
0,0,1,1,1,6,1,1,


1,1,1,1,1,1,0,0,
1,1,1,6,1,1,0,0,
1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,
1,1,1,6,1,1,0,0,
3,3,3,6,3,3,0,0,
1,1,1,1,1,1,0,0,
1,1,1,6,1,1,0,0,


0,0,1,1,1,1,1,1,
0,0,1,1,1,6,1,1,
0,0,1,1,1,6,1,1,
0,0,1,1,1,1,1,1,
0,0,1,1,1,6,1,1,
0,0,3,3,3,3,3,3,
0,0,1,3,1,3,1,3,
0,0,1,3,1,3,1,3,


1,1,1,1,1,1,0,0,
1,1,1,6,1,1,0,0,
1,1,1,6,1,1,0,0,
1,1,1,1,1,1,0,0,
1,1,1,6,1,1,0,0,
3,3,3,3,3,3,0,0,
1,3,1,3,1,3,0,0,
1,3,1,3,1,3,0,0,




0,0,0,0,3,3,3,3,
0,0,0,0,1,1,1,1,
0,0,0,0,1,1,3,1,
0,0,0,0,1,1,1,1,
0,0,0,0,1,1,1,1,
0,0,0,0,1,1,1,1,
0,0,0,0,1,1,1,1,
0,0,0,0,3,1,3,1,


3,3,3,3,0,0,0,0,
1,1,1,1,0,0,0,0,
1,1,3,1,0,0,0,0,
1,1,3,1,0,0,0,0,
1,1,3,1,0,0,0,0,
1,1,3,1,0,0,0,0,
1,1,1,1,0,0,0,0,
3,1,3,1,0,0,0,0,


0,0,0,0,3,3,3,7,
0,0,0,0,1,3,1,7,
0,0,0,0,1,3,1,7,
0,0,0,1,3,1,7,7,
0,0,0,1,3,1,7,7,
0,0,1,3,1,7,7,7,
0,0,1,3,1,7,7,7,
0,0,3,3,3,7,7,7,


7,7,7,7,0,0,0,0,
7,7,7,7,0,0,0,0,
7,7,7,7,0,0,0,0,
7,7,7,1,3,0,0,0,
7,7,7,1,3,0,0,0,
7,7,7,7,1,3,0,0,
7,7,0,7,1,3,0,0,
7,7,7,7,3,3,0,0,




0,0,0,0,0,0,1,1,
0,0,0,0,0,0,1,1,
0,0,0,0,0,0,1,1,
0,0,0,0,0,0,1,1,
0,0,0,0,0,0,1,1,
0,0,0,0,0,1,1,1,
0,0,0,0,0,1,1,1,
0,0,0,0,0,1,1,1,


3,1,0,0,0,0,0,0,
3,1,0,0,0,0,0,0,
3,1,0,0,0,0,0,0,
3,1,0,0,0,0,0,0,
3,1,0,0,0,0,0,0,
1,3,1,0,0,0,0,0,
1,3,1,0,0,0,0,0,
1,3,1,0,0,0,0,0,


0,0,0,0,0,1,1,1,
0,0,0,0,0,1,1,1,
0,0,0,0,0,1,1,1,
0,0,0,0,3,3,3,3,
0,0,0,0,7,7,7,7,
0,0,0,0,7,7,7,7,
0,0,0,0,3,1,3,1,
0,0,0,0,3,1,3,1,


1,3,1,0,0,0,0,0,
1,3,1,0,0,0,0,0,
1,3,1,0,0,0,0,0,
3,3,3,3,0,0,0,0,
7,7,7,7,0,0,0,0,
7,7,7,7,0,0,0,0,
3,1,3,1,0,0,0,0,
3,1,3,1,0,0,0,0,




0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,3,
0,0,0,0,0,0,0,3,
0,0,0,0,0,0,0,3,
0,0,0,0,0,0,0,3,
0,0,0,0,0,0,0,3,
0,0,0,0,0,0,0,1,


0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
3,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,


0,0,0,0,0,0,1,4,
0,0,0,0,0,0,1,1,
0,0,0,0,0,0,3,3,
0,0,0,0,0,0,3,4,
0,0,0,0,0,0,3,3,
0,0,0,0,0,0,3,3,
0,0,0,0,0,0,4,3,
0,0,0,0,0,0,1,1,


1,1,0,0,0,0,0,0,
1,1,0,0,0,0,0,0,
4,3,0,0,0,0,0,0,
4,3,0,0,0,0,0,0,
4,3,0,0,0,0,0,0,
4,3,0,0,0,0,0,0,
4,3,0,0,0,0,0,0,
3,1,0,0,0,0,0,0,




0,0,0,0,0,0,0,0,
0,0,0,3,3,9,9,3,
0,4,0,3,3,3,3,3,
4,4,4,3,3,3,3,3,
4,10,3,3,3,3,3,10,
4,4,10,10,3,3,10,10,
4,4,10,3,3,3,4,10,
4,4,10,3,3,3,4,10,


9,9,9,0,0,0,0,0,
3,3,9,9,9,0,0,0,
9,3,3,9,9,9,0,0,
10,9,3,3,3,3,0,0,
10,10,9,3,3,9,0,0,
4,10,10,9,3,9,9,0,
3,4,10,9,9,3,9,0,
10,10,3,3,3,3,9,0,


10,10,3,10,3,3,3,4,
4,10,3,10,3,3,3,3,
4,4,10,3,10,3,3,3,
0,4,10,10,3,3,10,3,
0,4,10,10,10,10,3,10,
0,0,4,4,4,10,10,3,
0,0,0,0,4,4,4,10,
0,0,0,0,0,0,4,4,


10,10,3,3,3,3,9,9,
4,4,3,3,3,3,3,3,
3,3,3,3,3,3,3,3,
3,3,3,10,3,3,9,0,
3,3,10,3,3,9,3,0,
10,3,3,3,3,3,0,0,
3,4,3,3,3,0,0,0,
4,4,0,0,0,0,0,0,




0,0,0,0,0,0,0,0,
0,14,14,0,0,0,0,14,
0,14,15,15,0,0,0,14,
0,0,0,16,16,0,0,0,
0,0,0,16,0,0,9,0,
0,0,0,0,0,10,3,9,
0,14,15,16,0,10,3,3,
0,14,15,16,16,1,1,1,


14,14,0,0,0,0,0,0,
15,15,14,0,0,0,0,0,
17,17,14,0,0,0,0,0,
17,17,0,0,0,16,15,15,
1,0,0,17,16,16,15,14,
1,10,3,9,17,0,14,14,
1,10,3,3,0,0,0,0,
1,0,10,10,0,0,3,0,


0,0,15,0,1,1,9,1,
0,0,17,17,17,10,1,1,
0,0,17,0,10,0,1,0,
0,17,17,0,17,0,1,3,
14,15,17,17,17,0,0,0,
15,15,16,0,0,0,0,3,
14,15,14,0,0,0,10,0,
0,14,0,0,0,0,0,0,


1,1,1,0,0,10,10,0,
3,3,1,10,0,0,0,0,
3,0,1,1,0,0,0,0,
3,3,17,17,0,0,0,0,
0,17,0,17,17,0,0,0,
0,0,0,0,16,16,14,0,
0,0,0,0,16,15,14,0,
0,0,0,0,0,14,14,0,




0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
6,6,6,6,6,6,6,6,


0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
6,6,6,6,6,6,6,6,


6,6,6,6,6,6,6,6,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,


6,6,6,6,6,6,6,6,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0
};
# 2 "mygbalib.h" 2



void drawSprite(int numb, int N, int x, int y)
{

    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x | 0x4000;
    *(unsigned short *)(0x7000004 + 8*N) = numb*8;
}


void moveL();
void moveR();
void moveD();
void hardDrop();
void rotateCW();
void rotateCCW();
void swapBlk();


void buttonS(){

}

void buttonSel(){

}


void buttonA(){
    rotateCW();
}

void buttonB(){
    rotateCCW();
}

void buttonR(){
    moveR();
}

void buttonL(){
    moveL();
}

void buttonD(){
    moveD();
}

void buttonU(){
    hardDrop();
}

void buttonLT(){
    swapBlk();
}

void buttonRT(){
    swapBlk();
}

void checkbutton(void)
{

    u16 buttons = (0x3FF & (~*(volatile u16*)0x4000130));

    if ((buttons & 0x001) == 0x001)
    {
        buttonA();

        while ((buttons & 0x001) == 0x001){
            buttons = (0x3FF & (~*(volatile u16*)0x4000130));
        }
    }
    if ((buttons & 0x002) == 0x002)
    {
        buttonB();

        while ((buttons & 0x002) == 0x002){
            buttons = (0x3FF & (~*(volatile u16*)0x4000130));
        }
    }
    if ((buttons & 0x004) == 0x004)
    {
        buttonSel();
    }
    if ((buttons & 0x008) == 0x008)
    {
        buttonS();
    }
    if ((buttons & 0x010) == 0x010)
    {
        buttonR();
    }
    if ((buttons & 0x020) == 0x020)
    {
        buttonL();
    }
    if ((buttons & 0x040) == 0x040)
    {
        buttonU();

        while ((buttons & 0x040) == 0x040){
            buttons = (0x3FF & (~*(volatile u16*)0x4000130));
        }
    }
    if ((buttons & 0x080) == 0x080)
    {
        buttonD();
    }


    if ((buttons & 0x200) == 0x200)
    {
        buttonLT();

        while ((buttons & 0x200) == 0x200){
            buttons = (0x3FF & (~*(volatile u16*)0x4000130));
        }
    }
    if ((buttons & 0x100) == 0x100)
    {
        buttonRT();

        while ((buttons & 0x100) == 0x100){
            buttons = (0x3FF & (~*(volatile u16*)0x4000130));
        }
    }
}


void fillPalette(void)
{
    int i;


    for (i = 0; i < 20; i++)
        ((unsigned short *) 0x5000200)[i] = palette[i];
}


void fillSprites(void)
{
    int i;


    for (i = 0; i < 128*16*16; i++)
        ((unsigned short *) 0x6010000)[i] = (sprites[i*2+1] << 8) + sprites[i*2];


    for(i = 0; i < 128; i++)
        drawSprite(0, i, 240,160);
}
# 9 "main.c" 2

# 1 "/usr/local/arm-thumb-elf/sys-include/time.h" 1 3 4
# 18 "/usr/local/arm-thumb-elf/sys-include/time.h" 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/machine/time.h" 1 3 4
# 19 "/usr/local/arm-thumb-elf/sys-include/time.h" 2 3 4
# 27 "/usr/local/arm-thumb-elf/sys-include/time.h" 3 4
# 1 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 1 3 4
# 28 "/usr/local/arm-thumb-elf/sys-include/time.h" 2 3 4

# 1 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 1 3 4
# 24 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 3 4
typedef short int __int16_t;
typedef unsigned short int __uint16_t;





typedef int __int32_t;
typedef unsigned int __uint32_t;






__extension__ typedef long long __int64_t;
__extension__ typedef unsigned long long __uint64_t;
# 59 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 3 4
# 1 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 1 3 4
# 151 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 60 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 2 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/machine/types.h" 1 3 4
# 36 "/usr/local/arm-thumb-elf/sys-include/machine/types.h" 3 4
typedef long int __off_t;
typedef int __pid_t;

__extension__ typedef long long int __loff_t;
# 61 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 2 3 4
# 82 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 3 4
typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;



typedef unsigned short ushort;
typedef unsigned int uint;



typedef unsigned long clock_t;




typedef long time_t;




struct timespec {
  time_t tv_sec;
  long tv_nsec;
};

struct itimerspec {
  struct timespec it_interval;
  struct timespec it_value;
};


typedef long daddr_t;
typedef char * caddr_t;







typedef unsigned short ino_t;
# 158 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 3 4
typedef short dev_t;




typedef long off_t;

typedef unsigned short uid_t;
typedef unsigned short gid_t;


typedef int pid_t;
typedef long key_t;
typedef _ssize_t ssize_t;
# 184 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 3 4
typedef unsigned int mode_t __attribute__ ((__mode__ (__SI__)));



typedef unsigned short nlink_t;
# 210 "/usr/local/arm-thumb-elf/sys-include/sys/types.h" 3 4
typedef long fd_mask;







typedef struct _types_fd_set {
        fd_mask fds_bits[(((64)+(((sizeof (fd_mask) * 8))-1))/((sizeof (fd_mask) * 8)))];
} _types_fd_set;
# 30 "/usr/local/arm-thumb-elf/sys-include/time.h" 2 3 4



struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;
};

clock_t clock (void);
double difftime (time_t _time2, time_t _time1);
time_t mktime (struct tm *_timeptr);
time_t time (time_t *_timer);

char *asctime (const struct tm *_tblock);
char *ctime (const time_t *_time);
struct tm *gmtime (const time_t *_timer);
struct tm *localtime (const time_t *_timer);

size_t strftime (char *_s, size_t _maxsize, const char *_fmt, const struct tm *_t);

char *asctime_r (const struct tm *, char *);
char *ctime_r (const time_t *, char *);
struct tm *gmtime_r (const time_t *, struct tm *);
struct tm *localtime_r (const time_t *, struct tm *);








char *strptime (const char *, const char *, struct tm *);
void tzset (void);
void _tzset_r (struct _reent *);
# 98 "/usr/local/arm-thumb-elf/sys-include/time.h" 3 4
extern time_t _timezone;
extern int _daylight;
extern char *_tzname[2];
# 126 "/usr/local/arm-thumb-elf/sys-include/time.h" 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/sys/features.h" 1 3 4
# 127 "/usr/local/arm-thumb-elf/sys-include/time.h" 2 3 4
# 11 "main.c" 2
# 20 "main.c"
int board[24][10];
int score = 0;

int timerCount = 0;




int bag[7] = {0, 1, 2, 3, 4, 5, 6};
int bagIndex = 7;

void shuffleBag() {

    int j = 0;
    int temp = 0;
    int i = 0;
    for (i = 6; i >= 0; i--) {

        j = rand() % (i + 1);
        temp = bag[i];
        bag[i] = bag[j];
        bag[j] = temp;
    }

    bagIndex = 0;
}

int getNextPiece() {
    if (bagIndex >= 7) {

        shuffleBag();
    }
    int piece = bag[bagIndex];
    bagIndex++;
    return piece;
}



void initBoard() {


    int i = 0;
    int j = 0;
    for (i = 0; i < 24; i++) {
        for (j = 0; j < 10; j++)
            board[i][j] = 0;
    }
    drawPlayingField(board);
}


int orientationIndex = 0;
int tetriminoIndex = 0;
int (*currentBlk)[4];


int (*holdBlk)[4];

void initHoldBlk(){
    holdBlk = nullTetrimino;
}


int currX = 3;
int currY = 0;

void eraseCurrentPiece(){

    int i = 0;
    int j = 0;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            if ((currentBlk)[i][j] != 0) {
                board[currY + i][currX + j] = 0;
            }
        }
    }

}

void drawCurrentPiece(){

    int i = 0;
    int j = 0;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            if ((currentBlk)[i][j] != 0) {
                board[currY + i][currX + j] = (currentBlk)[i][j];
            }
        }
    }

}



void initNewPiece(){
    tetriminoIndex = getNextPiece();
    orientationIndex = 0;
    currX = 3;
    currY = 0;
    currentBlk = tetriminos[tetriminoIndex][orientationIndex];
    drawCurrentPiece();
};


int canMove(int newX, int newY, int newRotation) {
    eraseCurrentPiece();
    int i = 0;
    int j = 0;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            if (tetriminos[tetriminoIndex][newRotation][j][i] != 0) {
                int x = newX + i;
                int y = newY + j;
                if (x < 0 || x >= 10 || y >= 24) {
                    drawCurrentPiece();
                    return 0;
                }
                if (y >= 0 && board[y][x] != 0) {
                    drawCurrentPiece();
                    return 0;
                }
            }
        }
    }
    drawCurrentPiece();
    return 1;
}



void moveL(){
    int newX = currX - 1;

    if(canMove(newX, currY, orientationIndex) == 1){
        eraseCurrentPiece();
        currX = newX;
        drawCurrentPiece();
    }


}

void moveR(){
    int newX = currX + 1;

    if(canMove(newX, currY, orientationIndex) == 1){
        eraseCurrentPiece();
        currX = newX;
        drawCurrentPiece();
    }
}

void moveD(){
    int newY = currY + 1;

    if(canMove(currX, newY, orientationIndex) == 1){
        eraseCurrentPiece();
        currY = newY;
        drawCurrentPiece();
    }
}

void hardDrop(){
    while(canMove(currX, currY+1, orientationIndex)){
        moveD();
    }
}

void rotateCW(){
    int newR = (orientationIndex + 1) % 4;


    if (canMove(currX, currY, newR) == 1){
        eraseCurrentPiece();
        orientationIndex = newR;
        currentBlk = (tetriminos)[tetriminoIndex][orientationIndex];
         drawCurrentPiece();
    }
}

void rotateCCW(){
    int newR = (orientationIndex - 1 + 4) % 4;



    if (canMove(currX, currY, newR) == 1){
        eraseCurrentPiece();
        orientationIndex = newR;
        currentBlk = (tetriminos)[tetriminoIndex][orientationIndex];
        drawCurrentPiece();
    }
}



void deleteFullRows(){
    int fullRows = 0;
    int newBoard[24][10];


    int i = 0;
    int j = 0;
    for (i = 0; i < 24; i++) {
        for (j = 0; j < 10; j++)
            newBoard[i][j] = 0;
    }

    int k = 24 - 1;

    for(j = 24 - 1; j >= 0; j--){
        int isFull = 1;
        for (i = 0; i < 10; i++) {
            if (board[j][i] == 0) {
                    isFull = 0;
                }
        }
        if(isFull == 1)
            fullRows++;
        else{

            for (i = 0; i < 10; i++) {
                newBoard[k][i] = board[j][i];
            }
            k--;
        }
    }


    for(j = 0; j < 24; j++){
        for(i = 0; i < 10; i++){
            board[j][i] = newBoard[j][i];
        }
    }
# 267 "main.c"
    if(fullRows == 1)
        score += 40;
    else if(fullRows == 2)
        score += 100;
    else if(fullRows == 3)
        score += 300;
    else if(fullRows >= 4)
        score += 1200;
}


void swapBlk(){

    if((*holdBlk) == nullTetrimino){

        eraseCurrentPiece();
        holdBlk = currentBlk;
        initNewPiece();
    }
    else{


        eraseCurrentPiece();
        int (*temp)[4] = holdBlk;
        currX = 3;
        currY = 0;
        holdBlk = currentBlk;
        currentBlk = temp;
        drawCurrentPiece();
    }
}







int isGameOver(){
    int gameOver = 0;
    int i = 0;
        for (i = 0; i < 10; i++) {

            if (board[3][i] != 0) {
                    gameOver = 1;
                }
        }
    return gameOver;
}
# 333 "main.c"
void gameLoop(){
    formatInitalBG();
    initBoard();
    initNewPiece();
    initHoldBlk();
    int gameTick = 0;
    while(1){


            checkbutton();


        drawPlayingField(board);

        if(gameTick % 20 == 0){


        if(canMove(currX, currY + 1, orientationIndex) == 0){
            if(isGameOver())
                break;

            deleteFullRows();
            initNewPiece();

        }
        }


        gameTick = (gameTick + 1) % 100;
    }
}
# 376 "main.c"
void Handler(void)
{
        *(u16*)0x4000208 = 0x00;


    if((*(volatile u16*)0x4000202 & 0x1) == 0x1){
        drawPlayingField(board);
    }


    if ((*(volatile u16*)0x4000202 & 0x8) == 0x8)
    {

        moveD();
# 405 "main.c"
    }

    *(volatile u16*)0x4000202 = *(volatile u16*)0x4000202;

    *(u16*)0x4000208 = 0x01;
}




int main(void)
{
    int i;


    *(u32*)0x4000000 = 0x2 | 0x40;



    srand(*(u16*)0x4000006 + time(0));




    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;




    initVram();

   fillPalette();
   fillSprites();
# 452 "main.c"
    (*(unsigned int*)0x3007FFC) = (int)&Handler;
    *(u16*)0x4000200 = 0x8;



    *(u16*)0x4000004 |= (1 << 3);
    *(u16*)0x4000200 |= (1 << 0);

    *(u16*)0x4000208 = 0x1;




    *(u16*)0x4000100 = 66535 - 16387;

    *(u16*)0x4000102 = (0x0080 | 0x0040 | 0x0003);



    gameLoop();



        return 0;
}
