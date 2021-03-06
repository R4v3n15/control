<?php

class PagosModel
{
	public static function getPaylist($lista, $page) {
        $page  = (int)$page;
        $filas = 20;
		$alumnos = GeneralModel::students($lista);
        // H::p('Alumnos: ', $alumnos);
        // exit();

		if ($alumnos !== null && count($alumnos) > 0) {
            // Paginar
            H::getLibrary('paginadorLib');
            $paginator  = new \Paginador();
            $items      = $paginator->paginar($alumnos, $page, $filas);
            $counter    = $page > 0 ? (($page*$filas)-$filas) + 1 : 1;
            $paginacion = $paginator->getView('pagination_ajax', 'students');

            // Busqueda
            View::renderFilters('filters');
            if (date('m') < 8) {
                self::displayPayListB($items, $paginacion, $counter);
            } else {
                self::displayPayListA($items, $paginacion, $counter);
            }

		} else {
			echo '<h4 class="text-center text-info subheader">
					No hay lista de pagos en este grupo.
				  </h4>';
		}
	}

    public static function displayPayListB($alumnos, $paginacion, $count){
        echo '<div class="table">';
            echo '<table id="tbl_paylist"
                         class="table table-bordered table-hover table-striped table-condensed">';
                echo '<thead>';
                echo '<tr class="info">';
                    echo '<th class="text-center">N°</th>';
                    echo '<th class="text-center">Alumno</th>';
                    echo '<th class="text-center">Datos</th>';
                    echo '<th class="text-center" title="Enero">Ene</th>';
                    echo '<th class="text-center" title="Febrero">Feb</th>';
                    echo '<th class="text-center" title="Marzo">Mar</th>';
                    echo '<th class="text-center" title="Abril">Abr</th>';
                    echo '<th class="text-center" title="Mayo">May</th>';
                    echo '<th class="text-center" title="Junio">Jun</th>';
                    echo '<th class="text-center" title="Julio">Jul</th>';
                    echo '<th class="text-center">Comentario</th>';
                    echo '<th class="text-center">Opciones</th>';
                echo '</tr>';
                echo '</thead>';
                echo '<tbody>';
                foreach ($alumnos as $alumno) {
                    $pagos = self::studentPayHistory($alumno->id);
                    $ene=0; $feb=0; $mar=0; $abr=0; $may=0; $jun=0; $jul=0; $beca='';
                    if ($pagos !== null) {
                        $ene=$pagos->ene; $feb=$pagos->feb; 
                        $mar=$pagos->mar; $abr=$pagos->abr; 
                        $may=$pagos->may; $jun=$pagos->jun; 
                        $jul=$pagos->jul;
                        $beca = $pagos->becado_b == '1' ? '<i class="mdi-action-beca">B</i><br>' : '';
                    }
                    echo '<tr class="row_data">';
                        echo '<td class="text-center tiny">'.($count++).'</td>';
                        echo '<td class="text-center tiny">'.$alumno->nombre.'</td>';
                        echo '<td class="text-center tiny">Family: 78965412</td>';
                        echo '<td class="text-center tiny">';
                            echo '<a href="#" class="check_pay" 
                                     data-student="'.$alumno->id.'" 
                                     data-month="ene"
                                     data-title="Enero"
                                     data-status="'.$ene.'"
                                     data-name="'.$alumno->nombre.'">'.$beca.self::statusIcon($ene).'</a>';
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                            echo '<a href="#" class="check_pay" 
                                     data-student="'.$alumno->id.'" 
                                     data-month="feb"
                                     data-title="Febrero"
                                     data-status="'.$feb.'"
                                     data-name="'.$alumno->nombre.'">'.$beca.self::statusIcon($feb).'</a>';
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                            echo '<a href="#" class="check_pay" 
                                     data-student="'.$alumno->id.'" 
                                     data-month="mar"
                                     data-title="Marzo"
                                     data-status="'.$mar.'"
                                     data-name="'.$alumno->nombre.'">'.$beca.self::statusIcon($mar).'</a>';
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                            echo '<a href="#" class="check_pay" 
                                     data-student="'.$alumno->id.'" 
                                     data-month="abr"
                                     data-title="Abril"
                                     data-status="'.$abr.'"
                                     data-name="'.$alumno->nombre.'">'.$beca.self::statusIcon($abr).'</a>';
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                            echo '<a href="#" class="check_pay" 
                                     data-student="'.$alumno->id.'" 
                                     data-month="may"
                                     data-title="Mayo"
                                     data-status="'.$may.'"
                                     data-name="'.$alumno->nombre.'">'.$beca.self::statusIcon($may).'</a>';
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                            echo '<a href="#" class="check_pay" 
                                     data-student="'.$alumno->id.'" 
                                     data-month="jun"
                                     data-title="Junio"
                                     data-status="'.$jun.'"
                                     data-name="'.$alumno->nombre.'">'.$beca.self::statusIcon($jun).'</a>';
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                            echo '<a href="#" class="check_pay" 
                                     data-student="'.$alumno->id.'" 
                                     data-month="jul"
                                     data-title="Julio"
                                     data-status="'.$jul.'"
                                     data-name="'.$alumno->nombre.'">'.$beca.self::statusIcon($jul).'</a>';
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                            if ($pagos !== null && $pagos->comment != null) {
                                echo $pagos->comment;
                                echo '<a href="#" class="add_comment" data-student="'.$alumno->id.'">
                                        <i class="mdi-content-create"></i></a>';
                            } else {
                                echo '<a href="#" class="add_comment" data-student="'.$alumno->id.'">Agregar comentario</a>';
                            }
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                        echo '<div class="btn-group tiny">';
                            echo '<a href="javascript:void(0)"
                                     class="btn btn-main btn-xs btn-raised">Pagar
                                  </a>';
                        echo '</div>';
                        echo '</td>';
                    echo '</tr>';
                }
                echo '</tbody>';
                echo '<tfoot>';
                echo '<tr>';
                    echo '<td class="text-center">
                            <button type="button" class="btn btn-xs mini btn-second change_multi">
                                Adeudos
                            </button>
                          </td>';
                    echo '<td class="text-center">
                            <button type="button" class="btn btn-xs mini btn-warning tekedown_multi">
                                Becados
                            </button>
                          </td>';
                    echo '<td class="text-center"></td>';
                    echo '<td class="text-center"></td>';
                    echo '<td class="text-center"></td>';
                    echo '<td class="text-center"></td>';
                    echo '<td class="text-center"></td>';
                    echo '<td class="text-center"></td>';
                    echo '<td class="text-center"></td>';
                    echo '<td class="text-center"></td>';
                    echo '<td class="text-center"></td>';
                    echo '<td class="text-center"></td>';
                echo '</tr>';
                echo '</tfoot>';
            echo '</table>';
            echo "<br><br><br>";
        echo '</div>';

        // Paginación
        echo '<div class="row">';
            echo '<div class="col-sm-12 text-center">';
                echo $paginacion;
            echo '</div>';
        echo '</div>';
    }

    public static function displayPayListA($alumnos, $paginacion, $count){
        echo '<div class="table">';
            echo '<table id="tbl_paylist"
                         class="table table-bordered table-hover table-striped table-condensed">';
                echo '<thead>';
                echo '<tr class="info">';
                    echo '<th class="text-center">N°</th>';
                    echo '<th class="text-center">Alumno</th>';
                    echo '<th class="text-center">Datos</th>';
                    echo '<th class="text-center" title="Agosto">Ago</th>';
                    echo '<th class="text-center" title="Septiembre">Sep</th>';
                    echo '<th class="text-center" title="Octubre">Oct</th>';
                    echo '<th class="text-center" title="Noviembre">Nov</th>';
                    echo '<th class="text-center" title="Diciembre">Dic</th>';
                    echo '<th class="text-center">Comentario</th>';
                    echo '<th class="text-center">Opciones</th>';
                echo '</tr>';
                echo '</thead>';
                echo '<tbody>';
                foreach ($alumnos as $alumno) {
                    $pagos = self::studentPayHistory($alumno->id);
                    $ago=0; $sep=0; $oct=0; $nov=0; $dic=0; $beca='';
                    if ($pagos !== null) {
                        $ago=$pagos->ago; $sep=$pagos->sep; 
                        $oct=$pagos->oct; $nov=$pagos->nov; 
                        $dic=$pagos->dic;
                        $beca = $pagos->becado_a == '1' ? '<i class="mdi-action-beca">B</i><br>' : '';
                    }
                    echo '<tr class="row_data">';
                        echo '<td class="text-center tiny">'.($count++).'</td>';
                        echo '<td class="text-center tiny">'.$alumno->nombre.'</td>';
                        echo '<td class="text-center tiny">Family: 78965412</td>';
                        echo '<td class="text-center tiny">';
                            echo '<a href="#" class="check_pay" 
                                     data-student="'.$alumno->id.'" 
                                     data-month="ago"
                                     data-title="Agosto"
                                     data-status="'.$ago.'"
                                     data-name="'.$alumno->nombre.'">'.$beca.self::statusIcon($ago).'</a>';
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                            echo '<a href="#" class="check_pay" 
                                     data-student="'.$alumno->id.'" 
                                     data-month="sep"
                                     data-title="Septiembre"
                                     data-status="'.$sep.'"
                                     data-name="'.$alumno->nombre.'">'.$beca.self::statusIcon($sep).'</a>';
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                            echo '<a href="#" class="check_pay" 
                                     data-student="'.$alumno->id.'" 
                                     data-month="oct"
                                     data-title="Octubre"
                                     data-status="'.$oct.'"
                                     data-name="'.$alumno->nombre.'">'.$beca.self::statusIcon($oct).'</a>';
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                            echo '<a href="#" class="check_pay" 
                                     data-student="'.$alumno->id.'" 
                                     data-month="nov"
                                     data-title="Noviembre"
                                     data-status="'.$nov.'"
                                     data-name="'.$alumno->nombre.'">'.$beca.self::statusIcon($nov).'</a>';
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                            echo '<a href="#" class="check_pay" 
                                     data-student="'.$alumno->id.'" 
                                     data-month="dic"
                                     data-title="Diciembre"
                                     data-status="'.$dic.'"
                                     data-name="'.$alumno->nombre.'">'.$beca.self::statusIcon($dic).'</a>';
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                        if ($pagos !== null && $pagos->comment != null) {
                            echo $pagos->comment;
                            echo '<a href="#" class="add_comment" data-student="'.$alumno->id.'">
                                    <i class="mdi-content-create"></i></a>';
                        } else {
                            echo '<a href="#" class="add_comment" data-student="'.$alumno->id.'">Agregar comentario</a>';
                        }
                        echo '</td>';
                        echo '<td class="text-center tiny">';
                        echo '<div class="btn-group tiny">';
                            echo '<a href="javascript:void(0)"
                                     class="btn btn-main btn-xs btn-raised">Pagar
                                  </a>';
                        echo '</div>';
                        echo '</td>';
                    echo '</tr>';
                }
                echo '</tbody>';
                echo '<tfoot>';
                echo '<tr>';
                echo '<td class="text-center">
                        <button type="button" class="btn btn-xs mini btn-second change_multi">
                            Adeudos
                        </button>
                      </td>';
                echo '<td class="text-center">
                        <button type="button" class="btn btn-xs mini btn-warning tekedown_multi">
                            Becados
                        </button>
                      </td>';
                echo '<td class="text-center"></td>';
                echo '<td class="text-center"></td>';
                echo '<td class="text-center"></td>';
                echo '<td class="text-center"></td>';
                echo '<td class="text-center"></td>';
                echo '<td class="text-center"></td>';
                echo '<td class="text-center"></td>';
                echo '<td class="text-center"></td>';
                echo '</tr>';
                echo '</tfoot>';
            echo '</table>';
            echo "<br><br><br>";
        echo '</div>';

        // Paginación
        echo '<div class="row">';
            echo '<div class="col-sm-12 text-center">';
                echo $paginacion;
            echo '</div>';
        echo '</div>';
    }

    public static function studentPayHistory($student, $year=null, $ciclo=null) {
        $database = DatabaseFactory::getFactory()->getConnection();

        // Setting year
        if ($year === null || $year === '') {
            $year = date('Y');
        }

        // Setting ciclo
        if ($ciclo === null || $ciclo === '') {
            $ciclo = self::getCiclo(date('m'));
        }

        // SQL: student history pay in given year and ciclo
        $history =  $database->prepare("SELECT * FROM students_pays 
                                        WHERE student_id = :student
                                          AND year       = :year
                                          AND ciclo      = :ciclo
                                        LIMIT 1;");
        $history->execute(array(':student' => $student,
                                ':year'    => $year,
                                ':ciclo'   => $ciclo));
        if ($history->rowCount() > 0) {
            return $history->fetch();
        }

        return null;
    }

    public static function payMonth($student, $month, $action, $year=null, $ciclo=null){
        $database = DatabaseFactory::getFactory()->getConnection();
        // Si no se especifica año y ciclo, se toman los actuales
        if ($year == null || $year == '') {
            $year = date('Y');
        }

        if ($ciclo == null || $ciclo == '') {
            $ciclo = self::getCiclo(date('m'));
        }

        // Validar si el alumno esta en la tabla pagos de la lista actual
        $get_student =  $database->prepare("SELECT student_id 
                                            FROM students_pays 
                                            WHERE student_id = :student
                                              AND year  = :year
                                              AND ciclo = :ciclo;");
        $get_student->execute(array(':student' => $student,
                                    ':year'    => $year,
                                    ':ciclo'   => $ciclo));

        $payed = false;
        if ($get_student->rowCount() > 0) {
            // Si esta en la tabla agregamos su pago en el mes correspondiente
            $set_pay =  $database->prepare("UPDATE students_pays 
                                            SET $month = :action
                                            WHERE student_id = :student
                                              AND year = :year
                                              AND ciclo = :ciclo;");
            $payed = $set_pay->execute(array(':student' => $student,
                                             ':action'  => $action,
                                             ':year'    => $year,
                                             ':ciclo'   => $ciclo));
        } else {
            // Si no esta en la tabla lo agregamos como una nueva entrada
            $set_pay =  $database->prepare("INSERT INTO students_pays(student_id, $month, year, ciclo)
                                                     VALUES(:student, :action, :year, :ciclo);");
            $set_pay->execute(array(':student' => $student,
                                    ':action'  => $action,
                                    ':year'    => $year,
                                    ':ciclo'   => $ciclo));
            if ($set_pay->rowCount() > 0) {
                $payed = true;
            }
        }

        return array('success' => $payed);
    }

    public static function saveComment($student, $comment, $year=null, $ciclo=null){
        $database = DatabaseFactory::getFactory()->getConnection();
        // Si no se especifica año y ciclo, se toman los actuales
        if ($year == null || $year == '') {
            $year = date('Y');
        }

        if ($ciclo == null || $ciclo == '') {
            $ciclo = self::getCiclo(date('m'));
        }

        // Validar si el alumno esta en la tabla pagos de la lista actual
        $get_student =  $database->prepare("SELECT student_id 
                                            FROM students_pays 
                                            WHERE student_id = :student
                                              AND year  = :year
                                              AND ciclo = :ciclo;");
        $get_student->execute(array(':student' => $student,
                                    ':year'    => $year,
                                    ':ciclo'   => $ciclo));

        $saved = false;
        if ($get_student->rowCount() > 0) {
            // Si esta en la tabla agregamos su pago en el mes correspondiente
            $set_comment =  $database->prepare("UPDATE students_pays 
                                            SET comment = :comment
                                            WHERE student_id = :student
                                              AND year = :year
                                              AND ciclo = :ciclo;");
            $saved = $set_comment->execute(array(':student' => $student,
                                             ':comment'  => $comment,
                                             ':year'    => $year,
                                             ':ciclo'   => $ciclo));
        } else {
            // Si no esta en la tabla lo agregamos como una nueva entrada
            $set_comment =  $database->prepare("INSERT INTO students_pays(student_id, year, ciclo, comment)
                                                     VALUES(:student, :year, :ciclo, :comment);");
            $set_comment->execute(array(':student' => $student,
                                        ':comment'  => $comment,
                                        ':year'    => $year,
                                        ':ciclo'   => $ciclo));
            if ($set_comment->rowCount() > 0) {
                $saved = true;
            }
        }

        return array('success' => $saved);
    }




    public static function getPayYearList(){
        $database = DatabaseFactory::getFactory()->getConnection();

        $get_year = $database->prepare("SELECT year FROM students_pays ORDER BY year ASC LIMIT 1");
        $get_year->execute();

        $years = [];
        $years[0] = new stdClass();
        $years[0]->year = (int)date('Y');
        if ($get_year->rowCount() > 0) {
            $year = $get_year->fetch();
            $diferencia = (int)date('Y') - (int)$year->year;
            for ($i = 1; $i <= $diferencia; $i++) {
                $years[$i] = new stdClass();
                $years[$i]->year = (int)date('Y') - $i;
            }
            return $years;
        }

        return $years;
    }

    public static function searchPaylist($group, $year=null, $ciclo=null, $month=null){
        $database = DatabaseFactory::getFactory()->getConnection();

        // Setting year
        if ($year === null || $year === '') {
            $year = date('Y');
        }

        // Setting ciclo
        if ($ciclo === null || $ciclo === '') {
            $ciclo = self::getCiclo(date('m'));
        }

        $students = GeneralModel::students($group);

        if ($students !== false) {
            self::displayListFiltered($students, $group, $month);
        } else {
            echo '<h4 class="text-center text-info subheader">
                    No hay lista de pagos en este grupo.
                  </h4>';
        }

    }



    public static function displayListFiltered($alumnos, $grupo, $mes){
        var_dump($alumnos, $grupo, $mes);
        // echo '<div class="table">';
        //     echo '<table id="tbl_list_'.$grupo.'"
        //                  class="table table-bordered table-hover table-striped table-condensed">';
        //         echo '<thead>';
        //             echo '<tr class="info">';
        //                 echo '<th class="text-center">Alumno</th>';
        //                 echo '<th class="text-center">Tel. 1</th>';
        //                 echo '<th class="text-center">Tel. 2</th>';
        //                 echo '<th class="text-center">Familiares</th>';
        //                 echo '<th class="text-center">Mes</th>';
        //                 echo '<th class="text-center">Adeudos</th>';
        //                 echo '<th class="text-center">Comentario</th>';
        //                 echo '<th class="text-center">Opciones</th>';
        //             echo '</tr>';
        //         echo '</thead>';
        //         echo '<tbody>';
        //         foreach ($alumnos as $alumno) {
        //             echo '<tr class="row_data">';
        //                 echo '<td class="text-center tiny">'.$alumno->nombre.'</td>';
        //                 echo '<td class="text-center tiny">Telefono 1</td>';
        //                 echo '<td class="text-center tiny">Telefono 2</td>';
        //                 echo '<td class="text-center tiny">Familiar</td>';
        //                 echo '<td class="text-center tiny">';
        //                     echo '<a href="javascript:void(0)" class="">'.
        //                         H::monthName($mes).
        //                         '</a>';
        //                 echo '</td>';
        //                 echo '<td class="text-center tiny">0</td>';
        //                 echo '<td class="text-center tiny">Comentario del pago</td>';
        //                 echo '<td class="text-center tiny">';
        //                 echo '<div class="btn-group">';
        //                     echo '<a href="javascript:void(0)"
        //                              class="btn btn-main btn-xs btn-raised">Pagar
        //                           </a>';
        //                 echo '</div>';
        //                 echo '</td>';
        //             echo '</tr>';
        //         }
        //         echo '</tbody>';
        //         echo '<tfoot>';
        //         echo '<tr>';
        //         echo '<td class="text-center"></td>';
        //         echo '<td class="text-center">
        //                 <button type="button" class="btn btn-xs mini btn-second change_multi">
        //                     Adeudos
        //                 </button>
        //               </td>';
        //         echo '<td class="text-center">
        //                 <button type="button" class="btn btn-xs mini btn-warning tekedown_multi">
        //                     Becados
        //                 </button>
        //               </td>';
        //         echo '<td class="text-center"></td>';
        //         echo '<td class="text-center"></td>';
        //         echo '<td class="text-center"></td>';
        //         echo '<td class="text-center"></td>';
        //         echo '<td class="text-center"></td>';
        //         echo '</tr>';
        //         echo '</tfoot>';
        //     echo '</table>';
        //     echo "<br><br><br>";
        // echo '</div>';
    }

    public static function statusIcon($status) {

        $status_icon = '<i class="mdi-action-done"></i>';
        switch ($status) {
            case '0': $status_icon = '<i class="mdi-action-done"></i>'; break;
            case '1': $status_icon = '<i class="mdi-action-done-all"></i>'; break;
            case '2': $status_icon = '<i class="mdi-action-beca">B</i>'; break;
            case '3': $status_icon = '<i class="mdi-action-na">N/A</i>'; break;
        }
        return $status_icon;

    } //-- Fin de la funcion getMonth()

    public static function getCiclo($month) {
        if ($month < 8) {
            // Agosto, Septiembre, Octubre, Noviembre, Diciembre
            $ciclo = 'B';
        } else {
            // Enero, Febrero, Marzo, Abril, Mayo, Junio y Julio
            $ciclo = 'A';
        }
         return $ciclo;
    }
}
