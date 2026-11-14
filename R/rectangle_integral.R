#' Integration numerique par la methode des rectangles
#'
#' Cette fonction approxime l'integrale d'une fonction sur un intervalle
#' en utilisant la méthode des rectangles a gauche.
#'
#' @param f Une fonction R a intégrer.
#' @param a La borne inferieure de l'intervalle.
#' @param b La borne superieure de l'intervalle.
#' @param n Le nombre de sous-intervalles. Doit etre un entier positif.
#'
#' @return Une valeur numerique correspondant a l'approximation de l'integrale.
#'
#' @examples
#' f <- function(x) x^2
#' rectangle_integral(f, a = 0, b = 4, n = 100)
#'
#' @export
rectangle_integral <- function(f, a, b, n = 100) {

  # Verification : f doit etre une fonction
  if (!is.function(f)) {
    stop("f doit etre une fonction.")
  }

  # Verification : n doit etre un entier positif
  if (length(n) != 1 || !is.numeric(n) || n <= 0 || n != as.integer(n)) {
    stop("n doit etre un entier positif.")
  }

  # Verification des bornes
  if (!is.numeric(a) || !is.numeric(b) ||
      length(a) != 1 || length(b) != 1 || a >= b) {
    stop("a et b doivent etre deux nombres avec a < b.")
  }

  # Calcul de la largeur de chaque sous-intervalle
  h <- (b - a) / n

  # Points situés a gauche de chaque sous-intervalle
  x <- a + (0:(n - 1)) * h

  # Calcul de l'approximation
  resultat <- h * sum(f(x))

  return(resultat)
}
