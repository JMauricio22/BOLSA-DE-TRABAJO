<div class="modal fade" id="laborSocialModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-form">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Labores Sociales</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="FormLaborSocial">
                    <div class="row">
                        <div class="col-12 mb-3">
                            <input class="form-control" type="text" placeholder="Labor social" name="nombreLaborSocial"/>
                        </div>
                        <div class="col-12 mb-3">
                            <input class="form-control" type="text" placeholder="Descripcion de la labor social" name="descripcionLaborSocial"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-confirm" id="guardarConocimientos" onclick="agregarLaborSocial()">Agregar</button>
            </div>
        </div>
    </div>
</div>