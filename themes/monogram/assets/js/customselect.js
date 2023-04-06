document.querySelectorAll('.customselect').forEach(setupSelector);

$(document).ready(function () {
	$('#form-description select').change(function () {
		$(this).closest('.customfield').find('ul').remove();
	});
});

function setupSelector(selector) {
    selector.addEventListener('change', e => {
        //console.log('changed', e.target.select);
        $("#"+e.target.select).val(e.target.value);
        $("#"+e.target.select).change();
    });
	
    selector.addEventListener('mousedown', e => {
        e.preventDefault();

        const select = selector.children[1];
        const dropDown = document.createElement('ul');
        dropDown.className = "selector-options";

        [...select.children].forEach(option => {
            const dropDownOption = document.createElement('li');
            dropDownOption.textContent = option.textContent;
            dropDownOption.setAttribute('id', option.getAttribute('id'));
            dropDownOption.setAttribute('data-value', option.value);

            dropDownOption.addEventListener('mousedown', (e) => {
                e.stopPropagation();
                e.target.classList.add('active', 'is_selected');
                select.value = option.value;
                selector.value = option.value;
                selector.id = option.id;
                selector.select = select.id;
                select.dispatchEvent(new Event('change'));
                selector.dispatchEvent(new Event('change'));
                dropDown.remove();
            }); 
			dropDown.appendChild(dropDownOption);
        });
		 
		selector.appendChild(dropDown); 
		
        // handle click out
        document.addEventListener('click', (e) => {
            if(e.target.id != ''){
				if($("#"+e.target.id).parent().find('ul').length == 2){
					$("#"+e.target.id).parent().find('ul').remove();
				}
			}else{
				
			}
			if (!selector.contains(e.target)) {
                dropDown.remove();
            }
        });

        // li selected
        $('.selector-options li').click(function () {
            $('.selector-options li').removeClass('is_selected');
            $(this).addClass('is_selected');
        });
    });
}