class Enfermeiro {
  int _corem = -1;

  Enfermeiro(int corem) {
    this.corem = corem;
  }

  set corem(int corem) {
    _corem = corem;
  }

  int get corem => _corem;
}
