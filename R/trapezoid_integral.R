#' Integration numerique par la methode des trapezes
#'
#' Cette fonction approxime l'integrale d'une fonction sur un intervalle
#' en utilisant la methode des trapezes.
#'
#' @param f Une fonction R à integrer.
#' @param a La borne inferieure de l'intervalle.
#' @param b La borne superieure de l'intervalle.
#' @param n Le nombre de sous-intervalles. Doit etre un entier positif.
#'
#' @return Une valeur numerique correspondant a l'approximation de l'integrale.
#'
#' @examples
#' f <- function(x) x^2
#' trapezoid_integral(f, a = 0, b = 4, n = 100)
#'
#' @export
trapezoid_integral <- function(f, a, b, n = 100) {

  # Verifier que f est bien une fonction
  if (!is.function(f)) {
    stop("f doit etre une fonction.")
  }

  # Verifier que n est un entier positif
  if (length(n) != 1 || !is.numeric(n) || n <= 0 || n != as.integer(n)) {
    stop("n doit etre un entier positif.")
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

  # Appliquer la formule des trapezes
  resultat <- h * (sum(y) - (y[1] + y[n + 1]) / 2)

  return(resultat)
}
