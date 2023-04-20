void drawSprite(int numb, int N, int x, int y)
{
    // Gift function: displays sprite number numb on screen at position (x,y), as sprite object N
    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x;
    *(unsigned short *)(0x7000004 + 8*N) = numb*2;
}
