<div class="container">
    <ol class="breadcrumb">
          <li><a href="javascript:void(0)" class="active">Principal</a></li>
    </ol>    
    <div class="well">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <?php $this->renderFeedbackMessages(); ?>
                <?php if ($this->alumnos): ?>
                <div class="table-responsive">
                    <table id="example" class="table table-bordered table-hover table-striped">
                        <thead>
                            <tr class="info">
                                <th>#</th>
                                <th>Foto</th>
                                <th>Nombre</th>
                                <th>Tutor</th>
                                <th>Grupo</th>
                                <th class="text-center">Opciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($this->alumnos as $alumno): ?>
                                <tr class="info">
                                    <td><?= $alumno->count; ?></td>
                                    <td><?= $alumno->avatar; ?></td>
                                    <td><?= $alumno->name.' '.$alumno->surname.' '.$alumno->lastname; ?></td>
                                    <td><?= $alumno->tutor->name; ?></td>
                                    <td></td>
                                    <td class="text-center">Opciones</td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
                </div>
                <?php endif ?>
            </div>
        </div>
    </div>
</div>

<div id="detailTask" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Vista Detallada</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="row">
                <div class="modal-footer col-sm-10 col-sm-offset-1 text-center">
                    <button type="button" class="btn btn-sm btn-naatik btn-raised" data-dismiss="modal">Cerrar</button>
                </div>             
            </div>
        </div>
    </div>
</div>

