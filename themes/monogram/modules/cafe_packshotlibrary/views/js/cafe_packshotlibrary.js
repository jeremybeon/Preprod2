$(document).ready(function() {
    // Lorsqu'on clique sur une image avec la classe 'modal-action-enable'
    $('.modal-action-enable').on('click', function(e) {
        e.preventDefault();

        // Récupérer l'ID de la modal et les chemins d'image (petite et grande)
        var modalId = $(this).data('modal-id');
        var largeImageSrc = $(this).data('large-image');

        // Mettre à jour l'image dans la modal avec le chemin de la grande image
        $('#' + modalId).find('img.img-responsive').attr('src', largeImageSrc);

        // Afficher la modal
        $('#' + modalId).modal('show');
    });

    // Lorsque la modal est masquée, réinitialiser l'image (vider l'attribut src)
    $('.modal.fade').on('hidden.bs.modal', function() {
        $(this).find('img.img-responsive').attr('src', '');
    });
});