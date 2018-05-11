var Padrinos = {
    vars: {
        currentPage: 0
    },
    initialize: function(){
        console.log('Padrinos Initialize');
        this.getSponsorsTable();
        this.newSponsor();
        this.saveSponsor();
    },

    getSponsorsTable: function(page=0) {
        let that = this;
        $.ajax({
            data: {page, page},
            synch: 'true',
            type: 'POST',
            url: _root_ + 'padrinos/padrinos',
            success: function(data){
                $('#sponsors_list').html(data);
                that.navigationPage();
                that.editSponsor();
            }
        });
    },

    navigationPage: function(lista){
        let that = this;
        $(".page-sponsors").on('click', function(event){
            event.preventDefault();
            that.vars.currentPage = parseInt($(this).data("sponsors"));
            that.getSponsorsTable($(this).data("sponsors"));
        });
    },

    newSponsor: function(){
        let that = this;
        $('#btnAddSponsor').on('click', function(){
            $('#modalAddNewSponsor').modal('show');
        });
    },

    saveSponsor: function(){
        let that = this;
        $('#saveNewSponsor').on('click', function(){
            var name = $('#sponsor_name');
            if (name !== '' && name !== undefined) {
                $.ajax({
                    data: $('#frmNewSponsor').serialize(),
                    synch: 'true',
                    type: 'POST',
                    url: _root_ + 'padrinos/nuevoPadrino',
                    success: function(data){
                        var response = JSON.parse(data);
                        switch(response) {
                            case 1:
                                $('#general_snack').attr('data-content', 'Datos guardados correctamente!');
                                $('#general_snack').snackbar('show');
                                $('.snackbar').addClass('snackbar-green');
                                break;
                            case 2:
                                $('#general_snack').attr('data-content', 'Fallo guardado de becario!');
                                $('#general_snack').snackbar('show');
                                $('.snackbar').addClass('snackbar-red');
                                break;
                            default:
                                $('#general_snack').attr('data-content', 'Error desconocido: Intente de nuevo!');
                                $('#general_snack').snackbar('show');
                                $('.snackbar').addClass('snackbar-red');
                                break;
                        }

                        $('#modalAddNewSponsor').modal('hide');
                        that.getSponsorsTable(that.vars.currentPage);
                    }
                });
            }
        });
    },

    editSponsor: function(){
        let that = this;
        $('.btn_edit_sponsor').on('click', function(){
            var sponsor = $(this).data('sponsor');

            $.ajax({
                data: { sponsor: sponsor },
                synch: 'true',
                type: 'POST',
                url: _root_ + 'padrinos/obtenerPadrino',
                success: function(data){
                    if (data != 'null') {
                        // var res = JSON.parse(data);
                        $('#sponsor_id').val(data.sponsor_id);
                        $('#edit_name').val(data.sp_name);
                        $('#edit_lastname').val(data.sp_surname);
                        $('#edit_email').val(data.sp_email);
                        $('#edit_type').val(data.sp_type);
                        $('#edit_description').val(data.sp_description);
                        
                        $('#modalEditSponsor').modal('show');
                    } else {
                        console.log('Notificación', data);
                    }
                }
            });
        });

        $('#btn_save_sponsor').on('click', function(){
            if ($('#sponsor_id').val() !== '' && $('#edit_name').val() !== '') {
                $.ajax({
                    data: $('#frmEditSponsor').serialize(),
                    synch: 'true',
                    type: 'POST',
                    url: _root_ + 'padrinos/actualizarPadrino',
                    success: function(data){
                        console.log(data);
                        if (data.success) {
                            $('#general_snack').attr('data-content', 'Datos Actualizados Correctamente!');
                            $('#general_snack').snackbar('show');
                            $('.snackbar').addClass('snackbar-blue');
                            that.getSponsorsTable(that.vars.currentPage);
                        } else {
                            $('#general_snack').attr('data-content', 'Error en actualizar, Intente de nuevo!');
                            $('#general_snack').snackbar('show');
                            $('.snackbar').addClass('snackbar-red');
                            console.log('Notificación: ', data);
                        }
                        $('#modalEditSponsor').modal('hide');
                    }
                });
            } else {
                $('#general_snack').attr('data-content', 'Hay Campos Vacios!');
                $('#general_snack').snackbar('show');
                $('.snackbar').addClass('snackbar-green');
            }
        });
    }
};

Padrinos.initialize();
