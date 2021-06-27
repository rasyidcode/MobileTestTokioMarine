class GithubErrorException implements Exception {
  final String message;
  GithubErrorException(this.message);
}
