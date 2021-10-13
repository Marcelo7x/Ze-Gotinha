class Medico {
  int _crm = -1;

  Medico(int crm) {
    this.crm = crm;
  }

  set crm(int crm) {
    _crm = crm;
  }

  int get crm => _crm;

}
