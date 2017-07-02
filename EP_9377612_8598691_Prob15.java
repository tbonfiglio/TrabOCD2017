
public class EP_9377612_8598691_Prob15 {
	
	// Matriz criada em memória
	public static int[][] matriz = {{	1, 	2, 	3, 	4, 	5, 	6, 	7, 	8}
									,{	11, 12, 13, 14, 15, 16, 17, 18}
									,{	21, 22, 23, 24, 25, 26, 27, 28}
									,{	31, 32, 33, 34, 35, 36, 37, 38}
									,{	41, 42, 43, 44, 45, 46, 47, 48}};
	
	public static void main(String []args){
		int i = 1;	// Primeira linha para fazer a troca
		int j = 4;	// Segunda linha para fazer a troca

		imprimirMatriz();
		
		trocaLinha(i, j);
		
		imprimirMatriz();
	}
	
	/**
	 * Função troca os valores de duas linhas de uma matriz MxN
	 * @param linha1 primeira linha que será trocada
	 * @param linha2 segunda linha que será trocada
	 */
	public static void trocaLinha(int linha1, int linha2){
		for (int coluna = 0; coluna < matriz[0].length; coluna++) {
			fazTroca(linha1, linha2, coluna);
		}		
	}
	
	/**
	 * Função troca o conteúdo de duas variáveis dentro de uma matriz
	 * @param linha1 Primeira linha recebida para fazer troca
	 * @param linha2 Segunda linha recebida para fazer a troca
	 * @param coluna Coluna em que está ocorrendo a troca
	 */
	public static void fazTroca(int linha1, int linha2, int coluna){
		int varAux;	// Variável auxiliar para guardar valor temporário durante a troca

		varAux = matriz[linha1][coluna];
		matriz[linha1][coluna] = matriz[linha2][coluna];
		matriz[linha2][coluna] = varAux;
	}
	
	public static void imprimirMatriz(){
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