import gifAnimation.*;
HelpMenu h;
PFont mono;
Gif gif;

SistemaParticulas p1;
float margenDerecho; //describe el limite a la derecha
float margenIzquierdo; // describe el limite a la izquierda
int clusters = 16;

void settings()
{
 	size(1200,600);
	//fullScreen();
	margenDerecho = floor((width-width/10));
	margenIzquierdo = floor((width/10));
 	p1 = new SistemaParticulas(clusters);


 	h = new HelpMenu();
}

void setup()
{
	p1.colorear();
	p1.generarPosiciones(clusters);
	//
	mono = createFont("Sanotra.ttf",32);
	textFont(mono);
	gif = new Gif(this, "helpImages/1.gif");
	gif.play();
}

void draw()
{
 	background(0);
 	//p1.centroG(true, 1);
 	//p1.move();
 	h.display();
 	h.backbtn();
 	image(gif, 10, 100);
}
