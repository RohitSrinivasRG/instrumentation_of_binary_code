To compile Kiss_FFT for instrumentation

``` shell
$ arm-none-eabi-gcc -o sample_kissfft -T linker.ld  -static  kiss_fft.c -I ./ -lm -specs=nosys.specs -nostartfiles
```

