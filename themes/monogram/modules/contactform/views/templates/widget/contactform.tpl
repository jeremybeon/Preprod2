<section class="contact-form">
  <form action="{$urls.pages.contact}" method="post" {if $contact.allow_file_upload}enctype="multipart/form-data"{/if}>
    {if $notifications}
      <div id="contactFormNotif" class="alert {if $notifications.nw_error}alert-danger{else}alert-success{/if}">
        <ul style="margin-bottom: 0;">
          {foreach $notifications.messages as $notif}
            <li>{$notif}</li>
          {/foreach}
        </ul>
      </div>
    {/if}

    {if !$notifications || $notifications.nw_error}
      <section class="form-fields">

        <div class="form-group row contact_form_title">
          <div class="col-md-12">
            <h3>{l s='Écrivez-nous' d='Shop.Theme.Global'}</h3>
            <button type="button" class="close hidden-md-up" data-dismiss="modal" aria-label="Close">&times;</button>
          </div>
        </div>

        <div class="form-group row">
          <div class="customfield">
            <label class="label_field form-control-label" for="id_contact">{l s='Motif*' d='Shop.Forms.Labels'}</label>
            <select name="id_contact" id="id_contact" class="form-control form-control-select">
            	<option style="height: 0;"></option>
              {foreach from=$contact.contacts item=contact_elt}
                <option value="{$contact_elt.id_contact}">{$contact_elt.name}</option>
              {/foreach}
            </select>
          </div>
        </div>

        <div class="form-group newsadd_field row">
          <div class="displayflex">
            <div class="namefield customfield" style="margin-right: 5px;width: calc(50% - 5px);">
              <label class="label_field form-control-label" for="email">{l s='Nom*' d='Shop.Forms.Labels'}</label>
              <input
                id="firstname"
                class="form-control"
                name="firstname"
                type="text"
                value="{$customer.firstname}"
              >
            </div>
            <div class="namefield customfield" style="margin-left: 5px;width: calc(50% - 5px);">
              <label class="label_field form-control-label" for="email">{l s='Prénom*' d='Shop.Forms.Labels'}</label>
              <input
                id="lastname"
                class="form-control"
                name="lastname"
                type="text"
                value="{$customer.lastname}"
              >
            </div>
          </div>
        </div>

        <div class="form-group row">
          <div class="customfield">
            <label class="label_field form-control-label {if !empty($contact.email)}effect2{/if}" for="email">{l s='Adresse email*' d='Shop.Forms.Labels'}</label>
            <input
              id="email"
              class="form-control"
              name="from"
              type="email"
              value="{$contact.email}"
            >
          </div>
        </div>

        {*{if $contact.orders}
          <div class="form-group row">
            <div class="customfield">
              <select id="id-order" name="id_order" class="form-control form-control-select effect2">
                <option value="">{l s='Select reference' d='Shop.Forms.Help'}</option>
                {foreach from=$contact.orders item=order}
                  <option value="{$order.id_order}">{$order.reference}</option>
                {/foreach}
              </select>
              <label class="col-md-3 form-control-label" for="id-order">{l s='Order reference' d='Shop.Forms.Labels'}</label>
            </div>
            <span class="col-md-3 form-control-comment">
              {l s='optional' d='Shop.Forms.Help'}
            </span>
          </div>
        {/if}*}

        {*{if $contact.allow_file_upload}
          <div class="form-group row">
            <div class="customfield">
              <input id="file-upload" type="file" name="fileUpload" class="filestyle" data-buttonText="{l s='Choose file' d='Shop.Theme.Actions'}">
              <label class="form-control-label" for="file-upload">{l s='Attachment' d='Shop.Forms.Labels'}</label>
            </div>
            <span class="form-control-comment">
              {l s='optional' d='Shop.Forms.Help'}
            </span>
          </div>
        {/if}*}

        <div class="form-group row">
          <div class="customfield">
            <label class="label_field form-control-label" for="contactform-message">{l s='Votre message*' d='Shop.Forms.Labels'}</label>
            <textarea
              id="contactform-message"
              class="form-control"
              name="message"
              rows="3"
            >{if $contact.message}{$contact.message}{/if}</textarea>
          </div>
        </div>

        {if isset($id_module)}
          <div class="form-group row">
            <div class="offset-md-3">
              {hook h='displayGDPRConsent' id_module=$id_module}
            </div>
          </div>
        {/if}

        <footer class="form-footer">
          <style>
            input[name=url] {
              display: none !important;
            }
          </style>
          <input type="text" name="url" value=""/>
          <input type="hidden" name="token" value="{$token}" />
          <input id="submitMessage" class="boutonstyle" type="submit" name="submitMessage" value="{l s='Envoyer' d='Shop.Theme.Actions'}">
        </footer>

      </section>
    {/if}

  </form>
</section>
