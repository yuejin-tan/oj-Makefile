#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

int main() {
    int N = 0;
    int sum = 0;
    int posCnt = 0;
    int negCnt = 0;

    scanf("%d", &N);

    for (int i = 0;i < N;i++)
    {
        int temp;
        scanf("%d", &temp);
        if (temp < 0)
        {
            negCnt++;
        }
        else if (temp > 0)
        {
            posCnt++;
            sum += temp;
        }
    }

    double avg = 0;
    if (posCnt)
    {
        avg = (double)sum / posCnt;
    }

    printf("%d %.1lf", negCnt, avg);

    return 0;
}
