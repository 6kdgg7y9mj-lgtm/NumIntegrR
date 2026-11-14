#' Integration numerique par la methode de Simpson
#'
#' Cette fonction approxime l'integrale d'une fonction sur un intervalle
#' en utilisant la methode de Simpson.
#'
#' @param f Une fonction R à integrer.
#' @param a La borne inferieure de l'intervalle.
#' @param b La borne superieure de l'intervalle.
#' @param n Le nombre de sous-intervalles. Doit etre un entier positif et pair.
#'
#' @return Une valeur numerique correspondant a l'approximation de l'integrale.
#'
#' @examples
#' f <- function(x) x^2
#' simpson_integral(f, a = 0, b = 4, n = 100)
#'
#' @export
simpson_integral <- function(f, a, b, n = 100) {

  # Verifier que f est bien une fonction
  if (!is.function(f)) {
    stop("f doit etre une fonction.")
  }

  # Verifier que n est un entier positif
  if (length(n) != 1 || !is.numeric(n) || n <= 0 || n != as.integer(n)) {
    stop("n doit etre un entier positif.")
  }

  # Verifier que n est pair
  if (n %% 2 != 0) {
    stop("Pour la methode de Simpson, n doit etre un nombre pair.")
  }

  # Verifier les bornes
  if (!is.numeric(a) || !is.numeric(b) ||
      length(a) != 1 || length(b) != 1 || a >= b) {
    stop("a et b doivent etre deux nombres avec a < b.")
  }

  # Calculer la largeur de chaque sous-intervalle
  h <- (b - a) / n

  # Creer tous les points de l'intervalle
  x <- seq(a, b, length.out = n + 1)

  # Calculer les valeurs de la fonction
  y <- f(x)

  # Identifier les indices impairs et pairs
  indices_impairs <- seq(2, n, by = 2)
  indices_pairs <- seq(3, n - 1, by = 2)

  # Appliquer la formule de Simpson
  resultat <- (h / 3) * (
    y[1] +
      y[n + 1] +
      4 * sum(y[indices_impairs]) +
      2 * sum(y[indices_pairs])
  )

  return(resultat)
}
