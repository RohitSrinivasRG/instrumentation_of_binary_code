#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "kiss_fft.h"

#define PI 3.14159265358979323846
#define SAMPLE_RATE 48000
#define NUM_SAMPLES 1024

int main() {
    // Allocate memory for input and output arrays
    kiss_fft_cpx *cx_in = (kiss_fft_cpx*)malloc(sizeof(kiss_fft_cpx) * NUM_SAMPLES);
    kiss_fft_cpx *cx_out = (kiss_fft_cpx*)malloc(sizeof(kiss_fft_cpx) * NUM_SAMPLES);
    
    // Create FFT configuration (forward transform)
    kiss_fft_cfg cfg = kiss_fft_alloc(NUM_SAMPLES, 0, NULL, NULL);
    
    if (!cfg) {
        printf("Error: Failed to allocate FFT configuration\n");
        return -1;
    }
    
    // Generate a test signal (1kHz + 5kHz sine waves)
    for (int i = 0; i < NUM_SAMPLES; i++) {
        double t = (double)i / SAMPLE_RATE;
        // 1kHz sine wave + 5kHz sine wave
        double signal = sin(2 * PI * 1000 * t) + 0.5 * sin(2 * PI * 5000 * t);
        
        cx_in[i].r = signal;  // Real part
        cx_in[i].i = 0.0;     // Imaginary part (zero for real signals)
    }
    
    // Perform the FFT
    kiss_fft(cfg, cx_in, cx_out);
    
    // Print the first few FFT results
    printf("FFT Results (first 10 bins):\n");
    for (int i = 0; i < 10; i++) {
        double magnitude = sqrt(cx_out[i].r * cx_out[i].r + cx_out[i].i * cx_out[i].i);
        printf("Bin %d: Magnitude = %f\n", i, magnitude);
    }
    
    // Free allocated memory
    free(cfg);
    free(cx_in);
    free(cx_out);
    
    return 0;
}
