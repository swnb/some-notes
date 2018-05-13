package main

import (
	"image"
	"image/color"
	"image/jpeg"
	"math"
	"os"
)

func main() {
	i1, _ := os.Open("./gpio.jpg")
	i2, _ := os.Open("./引脚.jpg")
	img1, _ := jpeg.Decode(i1)
	img2, _ := jpeg.Decode(i2)

	i1x, i2x, i1y, i2y := img1.Bounds().Max.X, img2.Bounds().Max.X, img1.Bounds().Max.Y, img2.Bounds().Max.Y
	iy := int(math.Max(float64(i1y), float64(i2y)))
	img := image.NewRGBA(image.Rect(0, 0, i1x+i2x, iy))
	for x := 0; x <= i1x; x++ {
		for y := 0; y <= iy; y++ {
			r, g, b, a := img1.At(x, y).RGBA()
			img.SetRGBA(x, y, color.RGBA{
				uint8(r >> 8), uint8(g >> 8), uint8(b >> 8), uint8(a >> 8),
			})
		}
	}
	for x := i1x; x <= i1x+i2x; x++ {
		for y := 0; y <= iy; y++ {
			r, g, b, a := img2.At(x-i1x, y).RGBA()
			img.SetRGBA(x, y, color.RGBA{
				uint8(r >> 8), uint8(g >> 8), uint8(b >> 8), uint8(a >> 8),
			})
		}
	}
	p, _ := os.OpenFile("./concat.jpg", os.O_CREATE|os.O_RDWR, 0600)
	jpeg.Encode(p, img, &jpeg.Options{Quality: 100})
}
