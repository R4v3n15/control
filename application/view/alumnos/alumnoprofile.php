<?php if ($this->alumno): 
    $alumno = $this->alumno;
    $clase  = $this->clase;
    $inscripcion = date('Y-m-d', strtotime($alumno->start_at));
    $url_base = Config::get('URL');
    $url_avatar = $url_base.Config::get('PATH_AVATAR_STUDENT');
?>
<div class="row">
    <div class="col-md-10 col-sm-9 col-xs-6">
        <h4 class="text-center text-info text-title">DATOS DEL ALUMNO</h4>
    </div>
    <div class="col-md-2 col-sm-3 col-xs-6 text-right">
        <button id="return_list" class="btn btn-naatik btn-tiny btn-sm">
            Cerrar &nbsp;<i class="glyphicon glyphicon-remove"></i>
        </button>
    </div>
    <div class="clearfix"></div>
    <div class="col-md-3" style="margin-bottom: 15px;">
        <div class="card">
            <div class="card-avatar">
                <img src="<?= $url_avatar.$alumno->avatar;?>.jpg" alt="avatar">
            </div>
            <div class="card-title">
                <h4 class="text-center text-naatik">
                    <?= $alumno->name.' '.$alumno->surname.' '.$alumno->lastname;?>
                </h4>
            </div>
            <div class="card-body">
                <ul class="card-list">
                    <li>
                        <b>Grupo:</b>
                        <?= ucwords(strtolower($clase->curso)).' '.ucwords(strtolower($clase->grupo)); ?>
                    </li>
                    <li><b>Edad:</b> <?= $alumno->age; ?> Años</li>
                    <li><b>Estatus:</b> <?= $alumno->status === '1' ? 'Activo' : 'En espera'; ?></li>
                </ul>
            </div>
            <div class="card-footer">
                <label>Fecha de Inscripción: <br> <?= H::formatDate($inscripcion); ?></label>
            </div>
        </div>
    </div>
    <div class="col-md-9">
        <div class="bs-component">
            <ul class="nav nav-tabs well line-head" style="margin-bottom: 15px;">
                <li class="active">
                    <a href="#personal" data-toggle="tab">ALUMNO</a>
                </li>
                <li>
                    <a href="#info_academic" data-toggle="tab">EDITAR DATOS DEL ALUMNO</a>
                </li>
                <li>
                    <a href="#info_tutor" data-toggle="tab">EDITAR DATOS DEL TUTOR</a>
                </li>
                <li>
                    <a href="#update_info" data-toggle="tab">EDITAR DATOS ACADEMICOS</a>
                </li>
            </ul>
            <div id="myTabContent" class="tab-content well line-body">
                <?php $this->renderFeedbackMessages(); ?>
                <div class="tab-pane fade active in" id="personal">
                    <div class="data-box">
                        <div class="row">
                        <div class="col-sm-6">
                            <h4>Datos Personales</h4>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-sm-6">
                            <p>
                                <strong>Nombre Completo: </strong>
                                <?= $alumno->name.' '.$alumno->surname.' '.$alumno->lastname;?>
                            </p>
                            <p><strong>Fecha de Nacimiento: </strong><?= H::formatDate($alumno->birthday); ?></p>
                            <p><strong>Edad:</strong> <?= $alumno->age; ?></p>
                            <p><strong>Sexo:</strong> <?= $alumno->genre; ?></p>
                            <p><strong>Estado Civil:</strong> <?= $alumno->edo_civil; ?></p>
                            <p><strong>Número Celular:</strong> <?= $alumno->cellphone; ?></p>
                        </div>
                        <div class="col-sm-6">
                            <p><strong>Dirección:</strong></p>
                            <?php if ($this->address): ?>
                                <p>Calle: <?= $this->address->street; ?>, Número: <?= $this->address->st_number; ?>, Entre: <?= $this->address->st_between; ?>, Colonia: <?= $this->address->colony; ?>.</p>
                            <?php endif ?>
                            <p><strong>Referencia Domiciliar:</strong> <?= $alumno->reference; ?></p>
                            <p><strong>Padecimientos:</strong> <?= $alumno->sickness; ?></p>
                            <p><strong>Tratamientos:</strong> <?= $alumno->medication; ?></p>
                        </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="data-box">
                            <h4>Datos Academicos</h4>
                                <p><strong>Ocupación: </strong><?= $alumno->ocupation; ?></p>
                                <p><strong>Donde:</strong><?= $alumno->workplace; ?></p>
                                <p>
                                    <strong>Ultimo Grado de estudios: </strong>
                                    <?= $alumno->studies.' '.$alumno->last_grade; ?>
                                </p>
                                <p>
                                    <strong>Inscrito en:</strong>
                                    <?= ucwords(strtolower($clase->curso)).' '.ucwords(strtolower($clase->grupo)); ?>
                                </p>
                                <p><strong>Becado:</strong> No</p>
                                <p><strong>Inscrito en la SEP: </strong> No</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="data-box">
                                <h4>Datos Del Tutor</h4>
                                <?php if ($this->tutor):  $tutor = $this->tutor; ?>
                                    <p><strong>Nombre: </strong><?= $tutor->namet; ?></p>
                                    <p><strong>Parentesco: </strong><?= $tutor->relationship; ?></p>
                                    <p><strong>Teléfono de Casa: </strong><?= $tutor->phone; ?></p>
                                    <p><strong>Teléfono Celular :</strong><?= $tutor->cellphone; ?></p>
                                    <p>
                                        <strong>Teléfono Alternativo: </strong>
                                            <?= $tutor->phone_alt; ?>
                                    </p>
                                    <p><strong>Ocupación: </strong><?= $tutor->job; ?></p>
                                <?php else: ?>
                                    <br>
                                    <br>
                                    <br>
                                    <h4 class="text-center text-naatik">No Tiene Tutor</h4>
                                    <br>
                                    <br>
                                    <br>
                                <?php endif ?>
                            </div>
                        </div>
                    </div>     
                </div>
                <div class="tab-pane fade" id="info_academic">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="data-box">
                            <h4>Datos Del Alumno</h4>
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label for="dia" class="col-sm-12 text-center"><small>Nombre Completo:</small></label>
                                    <div class="col-sm-4">
                                       <input type="text" 
                                              class="form-control text-center" 
                                              id="surname" 
                                              name="surname" 
                                              value="<?= $alumno->surname; ?>"
                                              pattern="[a-zA-Z\s]{2,60}" 
                                              autocomplete="off" required>
                                    </div>
                                    <div class="col-sm-4">
                                       <input type="text" 
                                              class="form-control text-center" 
                                              id="lastname" 
                                              name="lastname" 
                                              value="<?= $alumno->lastname; ?>"
                                              pattern="[a-zA-Z\s]{2,60}" 
                                              autocomplete="off" required>
                                    </div>
                                    <div class="col-sm-4">
                                       <input type="text" 
                                              class="form-control text-center" 
                                              id="name" 
                                              name="name" 
                                              value="<?= $alumno->name; ?>"
                                              pattern="[a-zA-Z\s]{2,60}" 
                                              autocomplete="off" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 col-sm-6"><small>Fecha de Nacimiento:</small> 
                                        <input type="tel" 
                                               class="form-control" 
                                               id="fecha_inicio" 
                                               name="birthday" 
                                               value="<?= $alumno->birthday; ?>"
                                               pattern="[0-9\s]{8,15}"
                                               autocomplete="off">
                                    </label>
                                    <label class="col-md-4 col-sm-6"><small>Sexo:</small> 
                                        <select class="form-control" name="genero">
                                            <option <?= $alumno->genre == 'Masculino' ? 'selected' : ''; ?> value="Masculino">Masculino</option>
                                            <option <?= $alumno->genre == 'Femenino' ? 'selected' : ''; ?> value="Femenino">Femenino</option>
                                        </select>
                                    </label>
                                    <label class="col-md-4 col-sm-6"><small>Estado Civil:</small> 
                                        <select class="form-control" name="edo_civil">
                                            <option <?= $alumno->edo_civil == 'Soltero(a)' ? 'selected' : ''; ?> value="Soltero(a)">Soltero(a)</option>
                                            <option <?= $alumno->edo_civil == 'Casado(a)' ? 'selected' : ''; ?> value="Casado(a)">Casado(a)</option>
                                        </select>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-6"><small>Número Celular:</small> 
                                        <input type="tel" 
                                               class="form-control"  
                                               name="celular" 
                                               value="<?= $alumno->cellphone; ?>"
                                               pattern="[0-9\s]{8,15}">
                                    </label>
                                    <label class="col-sm-6"><small>Referencia de Domicilio:</small> 
                                        <input type="tel" 
                                               class="form-control"  
                                               name="referencia" 
                                               value="<?= $alumno->reference; ?>"
                                               pattern="[0-9\s]{8,15}">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label for="dia" class="col-sm-12">Dirección:</label>
                                    <label class="col-md-3 col-sm-4"><small>Calle:</small>
                                       <input type="text" 
                                              class="form-control" 
                                              name="calle" 
                                              value="<?= $this->address->street; ?>">
                                    </label>
                                    <label class="col-md-3 col-sm-4"><small>Número:</small>
                                       <input type="text" 
                                              class="form-control" 
                                              name="numero" 
                                              value="<?= $this->address->st_number; ?>">
                                    </label>
                                    <label class="col-md-3 col-sm-4"><small>Entre:</small>
                                       <input type="text" 
                                              class="form-control" 
                                              name="entre" 
                                              value="<?= $this->address->st_between; ?>">
                                    </label>
                                    <label class="col-md-3 col-sm-4"><small>Colonia:</small>
                                       <input type="text" 
                                              class="form-control"  
                                              name="colonia" 
                                              value="<?= $this->address->colony; ?>"
                                              pattern="[a-zA-Z\s]{2,60}">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-6"><small>Padecimientos:</small> 
                                        <input type="tel" 
                                               class="form-control"  
                                               name="padecimiento" 
                                               value="<?= $alumno->sickness; ?>">
                                    </label>
                                    <label class="col-sm-6"><small>Tratamiento:</small> 
                                        <input type="tel" 
                                               class="form-control"  
                                               name="tratamiento" 
                                               value="<?= $alumno->medication; ?>">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 col-sm-6"><small>¿Es de familia Homestay?:</small> 
                                        <div class="radio radio-info">
                                            <label> No
                                                <input type="radio" 
                                                       <?= $alumno->homestay == '0' ? 'checked' : ''; ?> 
                                                       value="0" 
                                                       name="homestay">
                                                <span class="circle"></span><span class="check"></span>
                                            </label>
                                            <label></label>
                                            <label> SI
                                                <input type="radio"
                                                       <?= $alumno->homestay == '1' ? 'checked' : ''; ?>
                                                       value="1" 
                                                       name="homestay">
                                                <span class="circle"></span><span class="check"></span>
                                            </label>
                                        </div>
                                    </label>
                                    <label class="col-md-4 col-sm-6"><small>¿Entregó Acta de Nacimiento?:</small> 
                                        <div class="radio radio-info">
                                            <label> No
                                                <input type="radio" 
                                                       value="0"
                                                       <?= $alumno->acta_nacimiento == '0' ? 'checked' : ''; ?> 
                                                       name="acta">
                                                <span class="circle"></span><span class="check"></span>
                                            </label>
                                            <label></label>
                                            <label> SI
                                                <input type="radio" 
                                                       value="1" 
                                                       <?= $alumno->acta_nacimiento == '1' ? 'checked' : ''; ?>
                                                       name="acta">
                                                <span class="circle"></span><span class="check"></span>
                                            </label>
                                        </div>
                                    </label>
                                    <label class="col-md-4 col-sm-6"><small>¿Requiere Factura?:</small> 
                                        <div class="radio radio-info">
                                            <label> No
                                                <input type="radio"
                                                       value="0" 
                                                       <?= $alumno->facturacion == '0' ? 'checked' : ''; ?>
                                                       name="facturacion">
                                                <span class="circle"></span><span class="check"></span>
                                            </label>
                                            <label></label>
                                            <label> SI
                                                <input type="radio" 
                                                       value="1" 
                                                       <?= $alumno->facturacion == '1' ? 'checked' : ''; ?>
                                                       name="facturacion">
                                                <span class="circle"></span><span class="check"></span>
                                            </label>
                                        </div>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12 text-center">
                                        <button type="submit" class="btn btn-sm btn-second btn-raised">Actualizar</button>
                                    </div>
                                </div>
                            </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="info_tutor">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="data-box">
                            <h4>Datos Del Tutor</h4>
                            <form class="form-horizontal">
                                <?php if ($this->tutor):  $tutor = $this->tutor; ?>
                                    <div class="form-group">
                                        <label class="col-sm-12 text-center"><small>Nombre Completo:</small></label>
                                        <div class="col-sm-4">
                                            <input type="text" 
                                                   class="form-control text-center" 
                                                   id="apellido_pat" 
                                                   name="apellido_pat"
                                                   pattern="[a-zA-Z\s]{3,60}" 
                                                   value="<?= $tutor->surname1; ?>" 
                                                   autocomplete="off">
                                        </div>
                                        <div class="col-sm-4">
                                            <input type="text" 
                                                   class="form-control text-center" 
                                                   id="apellido_pat" 
                                                   name="apellido_mat"
                                                   pattern="[a-zA-Z\s]{3,60}" 
                                                   value="<?= $tutor->surname2; ?>" 
                                                   autocomplete="off">
                                        </div>
                                        <div class="col-sm-4">
                                            <input type="text" 
                                                   class="form-control text-center" 
                                                   id="nombre_tutor" 
                                                   name="nombre_tutor"
                                                   pattern="[a-zA-Z\s]{3,60}" 
                                                   value="<?= $tutor->namet; ?>" 
                                                   autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4"><small>Ocupación:</small> 
                                            <input type="tel" 
                                                   class="form-control" 
                                                   id="tel_celular" 
                                                   name="tel_celular" 
                                                   value="<?= $tutor->job; ?>"
                                                   pattern="[0-9\s]{8,15}"
                                                   autocomplete="off">
                                        </label>
                                        <label class="col-sm-4"><small>Parentesco:</small> 
                                            <select class="form-control " name="parentesco">
                                                <option value="">Seleccione...</option>
                                                <option <?= $tutor->relationship == 'Madre' ? 'selected' : ''; ?> value="Madre">Madre</option>
                                                <option <?= $tutor->relationship == 'Padre' ? 'selected' : ''; ?> value="Padre">Padre</option>
                                                <option <?= $tutor->relationship == 'Abuelo(a)' ? 'selected' : ''; ?> value="Abuelo(a)">Abuelo(a)</option>
                                                <option <?= $tutor->relationship == 'Hermano(a)' ? 'selected' : ''; ?> value="Hermano(a)">Hermano(a)</option>
                                                <option <?= $tutor->relationship == 'Tio(a)' ? 'selected' : ''; ?> value="Tio(a)">Tío(a)</option>
                                                <option <?= $tutor->relationship == 'Tutor' ? 'selected' : ''; ?> value="Tutor">Tutor</option>
                                            </select>
                                        </label>
                                        <label class="col-sm-4"><small>Teléfono de Casa:</small> 
                                            <input type="tel" 
                                                   class="form-control" 
                                                   id="tel_casa" 
                                                   name="tel_casa" 
                                                   value="<?= $tutor->phone; ?>" 
                                                   pattern="[0-9\s]{8,15}"
                                                   autocomplete="off">

                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4"><small>Teléfono Celular:</small> 
                                            <input type="tel" 
                                                   class="form-control" 
                                                   id="tel_celular" 
                                                   name="tel_celular" 
                                                   value="<?= $tutor->cellphone; ?>"
                                                   pattern="[0-9\s]{8,15}"
                                                   autocomplete="off">
                                        </label>
                                        <label class="col-sm-4"><small>Otro Familiar:</small> 
                                            <select class="form-control " name="parentesco">
                                                <option value="">Seleccione...</option>
                                                <option <?= $tutor->relationship_alt == 'Madre' ? 'selected' : ''; ?> value="Madre">Madre</option>
                                                <option <?= $tutor->relationship_alt == 'Padre' ? 'selected' : ''; ?> value="Padre">Padre</option>
                                                <option <?= $tutor->relationship_alt == 'Abuelo(a)' ? 'selected' : ''; ?> value="Abuelo(a)">Abuelo(a)</option>
                                                <option <?= $tutor->relationship_alt == 'Hermano(a)' ? 'selected' : ''; ?> value="Hermano(a)">Hermano(a)</option>
                                                <option <?= $tutor->relationship_alt == 'Tio(a)' ? 'selected' : ''; ?> value="Tio(a)">Tío(a)</option>
                                                <option <?= $tutor->relationship_alt == 'Tutor' ? 'selected' : ''; ?> value="Tutor">Tutor</option>
                                            </select>
                                        </label>
                                        <label class="col-sm-4"><small>Teléfono de Familiar:</small> 
                                            <input type="tel" 
                                                   class="form-control" 
                                                   id="tel_casa" 
                                                   name="tel_casa" 
                                                   value="<?= $tutor->phone_alt; ?>" 
                                                   pattern="[0-9\s]{8,15}"
                                                   autocomplete="off">
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12 text-center">
                                            <button type="submit" class="btn btn-sm btn-second btn-raised">Actualizar</button>
                                        </div>
                                    </div>
                                <?php else: ?>
                                    
                                <?php endif ?>
                            </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="update_info">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="data-box">
                            <h4>Datos Academicos</h4>
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-6"><small>Ocupación:</small> 
                                        <select class="form-control" name="ocupacion">
                                            <option <?= $alumno->ocupation == 'Estudiante' ? 'selected' : ''; ?> value="Estudiante">Estudio</option>
                                            <option <?= $alumno->ocupation == 'Trabajador' ? 'selected' : ''; ?> value="Trabajador">Trabajo</option>
                                            <option <?= $alumno->ocupation == 'Ninguno' ? 'selected' : ''; ?> value="Ninguno">Ninguno</option>
                                        </select>
                                    </label>
                                    <label class="col-sm-6"><small>Lugar de Trabajo/Estudio:</small> 
                                        <input type="tel" 
                                               class="form-control"  
                                               name="lugar_trabajo" 
                                               value="<?= $alumno->workplace; ?>">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-6"><small>Nivel de Estudios:</small> 
                                        <select class="form-control" id="nivel" name="nivel_estudio">
                                            <option value="">Seleccione...</option>
                                            <option <?= $alumno->studies == 'Preescolar' ? 'selected' : ''; ?> value="Preescolar">Preescolar</option>
                                            <option <?= $alumno->studies == 'Primaria' ? 'selected' : ''; ?> value="Primaria">Primaria</option>
                                            <option <?= $alumno->studies == 'Secundaria' ? 'selected' : ''; ?> value="Secundaria">Secundaria</option>
                                            <option <?= $alumno->studies == 'Bachillerato' ? 'selected' : ''; ?> value="Bachillerato">Bachillerato</option>
                                            <option <?= $alumno->studies == 'Licenciatura' ? 'selected' : ''; ?> value="Licenciatura">Licenciatura</option>
                                        </select>
                                    </label>
                                    <label class="col-sm-6"><small>ültimo Grado Estudio:</small> 
                                        <select class="form-control" name="grado_estudio">
                                            <option value="">Seleccione...</option>
                                            <option <?= $alumno->last_grade == 'Primer Año' ? 'selected' : ''; ?> value="Primer Año">Primer Año.</option>
                                            <option <?= $alumno->last_grade == 'Segundo Año' ? 'selected' : ''; ?> value="Segundo Año">Segundo Año.</option>
                                            <option <?= $alumno->last_grade == 'Tercer Año' ? 'selected' : ''; ?> value="Tercer Año">Tercer Año.</option>
                                            <option <?= $alumno->last_grade == 'Cuarto Año' ? 'selected' : ''; ?> value="Cuarto Año">Cuarto Año.</option>
                                            <option <?= $alumno->last_grade == 'Quinto Año' ? 'selected' : ''; ?> value="Quinto Año">Quinto Año.</option>
                                            <option <?= $alumno->last_grade == 'Sexto Año' ? 'selected' : ''; ?> value="Sexto Año">Sexto Año.</option>
                                            <option <?= $alumno->last_grade == 'Concluido' ? 'selected' : ''; ?> value="Concluido">Concluido.</option>
                                        </select>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12 text-center">
                                        <button type="submit" class="btn btn-sm btn-second btn-raised">Actualizar</button>
                                    </div>
                                </div>
                            </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php endif ?>