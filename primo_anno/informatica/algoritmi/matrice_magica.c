//verificare se una matrice NxN quatrata è magica

#define N 10
#include <stdio.h>

int main() {
	
	int m[N][N];
	int i; //riga
	int j; //colonna
	
	int somma_ref = 0; // somma di riferimento
	int somma = 0; // somma di ogni riga/colonna/diagonale secondaria
	
	for(i=0; i<N; i++) {
		for(j=0; j<N; j++) {
		    m[i][j] = 8; // matrice magica tutta composta da 8 
	    }
	}
	
	for(i=0; i<N; i++) {
	    somma_ref += m[i][i]; // diagonale principale
	} 

	for(i=0; i<N; i++) {
	    somma += m[i][N-i-1]; // diagonale secondaria
	}
	
	if(somma != somma_ref) {
		printf("Matrice non magica!\n");
		return 0;
	}
	
	for(i=0; i<N; i++){
	    somma = 0;
	    for(j=0; j<N; j++) {
			somma += m[i][j]; // somma riga i
	    }	
	    if(somma!=somma_ref) {
	    	printf("Matrice non magica!\n");
	    	return 0;
	    }
	}
	
	for(j=0; j<N; j++) {
	    somma = 0;
	    for(i=0; i<N; i++) {
			somma += m[i][j]; // somma colonna j
	    }
	    if(somma != somma_ref) {
	    	printf("Matrice non magica!\n");
	    	return 0;
	    }
	}
	
	// se è arrivata fin qui le somme sono state tutte uguali quindi la matrice è magica	
    printf("matrice MAGICA!!!");
}
