all: slides.pdf

pics = $(addprefix ppt/media/image, 1.png 2.png 3.png 4.png 5.png 6.png)

slides.pdf: slides.tex $(pics)
	pdflatex $<
	pdflatex $<

$(pics): presentation_rus.pptx
	unzip -uDD $^ $@

clean:
	rm -r $(pics)
	rmdir -p ppt/media/image
	rm slides.log slides.aux slides.nav slides.out slides.pdf slides.snm slides.toc

.PHONY: all clean
