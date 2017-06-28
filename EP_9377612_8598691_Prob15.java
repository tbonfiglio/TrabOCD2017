
public class EP_Marco_Thiago_Prob15 {
	
	public static void main(String []args){
		
		int[][] matriz = {{	1, 	2, 	3, 	4, 	5, 	6, 	7, 	8}
						,{	11, 12, 13, 14, 15, 16, 17, 18}
						,{	21, 22, 23, 24, 25, 26, 27, 28}
						,{	31, 32, 33, 34, 35, 36, 37, 38}
						,{	41, 42, 43, 44, 45, 46, 47, 48}};
		
		int i = 1;
		int j = 4;
		int varAux = 0;	// variavel auxiliar para guardar valor temporario durante a troca
		
		imprimirMatriz(matriz);
		
		for (int coluna = 0; coluna < matriz[0].length; coluna++) {
			varAux = matriz[i][coluna];
			matriz[i][coluna] = matriz[j][coluna];
			matriz[j][coluna] = varAux;
		}
		
		imprimirMatriz(matriz);
	}	
	
	public static void imprimirMatriz(int[][] matriz){
		System.out.println();
		for (int i = 0; i < matriz.length; i++){
			for (int j = 0; j < matriz[0].length; j++){
				System.out.print(matriz[i][j]);
				System.out.print("-");
			}
			System.out.println();
		}
	}
}