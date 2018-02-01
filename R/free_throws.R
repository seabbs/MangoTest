#' NBA Free Throws Data
#'
#' A dataframe of NBA free throw data as supplied by Mango Solutions
#' @format A data frame with 618,019 rows and 11 variables.
#' \describe{
#'   \item{end_result}{Character, final score of the game.}
#'   \item{game}{Character, identifies the two teams playing}
#'   \item{game_id}{Numeric game id.}
#'   \item{period}{Numeric, which period was the play made in.}
#'   \item{play}{Character string outlining the play}
#'   \item{player}{Character, the name of the player}
#'   \item{playoffs}{Character string, type of game}
#'   \item{score}{Character string identifying the final score}
#'   \item{season}{Character identifying the season the game was played in.}
#'   \item{shot_made}{Binary, was a shot made}
#'   \item{time}{Time at which a play occurred}
#' }
"free_throws"
