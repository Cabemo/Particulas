class SistemaParticulas
{
	Ball[][] sp;
	float[][] posiciones;
	color[]colores = {#16a085, //verde
	                  #e67e22, //naranja
	                  #c0392b, //rojo
	                  #2980b9, //azul
	                  #f1c40f, //amarillo
	                  #8e44ad, //morado
	                  #f368e0, //rosa
	                  #E4E5E5, //blanco grisoso
	                  #ff5e57, //rojo claro
	                  #0be881, //verde claro
	                  #4bcffa, //azul claro
	                  #f53b57 //rosa fuerte
	                 };

	SistemaParticulas(int size)
	{
		int numParticulas = 4000/size;
		sp = new Ball[size][numParticulas];
		posiciones = new float[size][2];
	}
	
	void move()
	{
		for(int i = 0; i < sp.length; i++)
		{
			for(Ball b: sp[i])
			{
				b.move();
				b.display();
			}
		}
	}

	void colorear()
	{
		for(int i = 0; i < sp.length; i++)
		{
			color c = colores[(int)random(colores.length)];
			for(int j = 0; j < sp[0].length; j++)
			{
				sp[i][j] = new Ball(c);
			}
		}
	}

	void colorear(color c)
	{
		for(int i = 0; i < sp.length; i++)
		{
			for(int j = 0; j < sp[0].length; j++)
			{
				sp[i][j] = new Ball(c);
			}
		}
	}

	void generarPosiciones()
	{
		float inc = TWO_PI/25.0, a = 0.0,value=0.0;
		for(int i = 0; i < posiciones.length; i++)
		{
			for(int j = 0; j < 2; j++)
			{
				if(j == 0)
				{
					value = (i*width/15);
					posiciones[i][j] = sin(a)+map(value, 0,width,margenIzquierdo,margenDerecho);
					a += inc;
				}
				else if(j == 1) posiciones[i][j] = random(height/3) + height/3;
			}
		}
	}

	void centroG(boolean azar, int main)
	{
		int x = width/(sp.length + 2);
		int y = height/8;
		int contador = 1;
		
		 for(int i = 0; i < sp.length; i++)
		 {
			for(Ball b : sp[i])
			{
					if(main > 0)
					{
						b.centroG(mouseX, mouseY, false);
					}
					else
					{
						if(azar) b.centroG(posiciones[i][0], posiciones[i][1], true);
						else
						{
							b.centroG(x * contador, y * 4, true);
						}
					}
			}
			contador++;
			main--;
		}
	}
}
