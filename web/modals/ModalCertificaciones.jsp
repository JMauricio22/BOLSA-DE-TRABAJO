<div class="modal fade" id="certificacionesModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-form">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Certificacion</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="FormCertificaciones">
                    <div class="row">
                        <div class="col-12 mb-3">
                            <input class="form-control" type="text" placeholder="Titulo" name="tituloCertificacion[]"/>
                        </div>
                        <div class="col-12 mb-3">
                            <input class="form-control" type="text" placeholder="Tipo de Certificacion" name="tipoCertificacion[]"/>
                        </div>
                        <div class="col-12 mb-3">
                            <input class="form-control" type="text" placeholder="Codigo" name="codigoCertificacion[]"/>
                        </div>
                        <div class="col-12 mb-3">
                            <input class="form-control" type="text" placeholder="Institucion" name="institucionCertificacion[]"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-confirm" id="guardarConocimientos" onclick="agregarCertificacion()">Agregar</button>
            </div>
        </div>
    </div>
</div>