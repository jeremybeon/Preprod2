{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
 
{extends 'customer/page.tpl'}

{block name='page_content'}  {*{var_dump($cat)}*}
	{if $cat == 'rdv'}
		<div class="mes_rdv">
			<div class="custom_accountpage">
	        	<div class="pagetitle"> 
	            	<h1 class="page_title">
	                	{l s='Mes rendez-vous en cours' d='Shop.Theme.Customeraccount'}
	                </h1>
	            </div>
	            <div class="mes_rdv_cover displayflex">
	            	<div class="rdv_item">
	                	<div class="rdv_itemcover">
	            			<div class="rdv_desc">
	            				<p class="rdv_title">Rendez-vous au showroom Paris 8e</p>
	            				<p><span>{l s='Le :' d='Shop.Theme.Customeraccount'}</span> Lundi 30 août 2021</p>
	            				<p><span>{l s='À :' d='Shop.Theme.Customeraccount'}</span> 10h15</p>
	            				<p><span>{l s='Motif :' d='Shop.Theme.Customeraccount'}</span> Acheter un article</p>
	            			</div>
	            			<div class="rdv_link displayflex">
	            				<a href="" title="{l s='Modifier le rdv' d='Shop.Theme.Customeraccount'}">{l s='Modifier le rdv' d='Shop.Theme.Customeraccount'}</a>
	            				<a href="" title="{l s='Annuler le rdv' d='Shop.Theme.Customeraccount'}">{l s='Annuler le rdv' d='Shop.Theme.Customeraccount'}</a>
	            			</div>
	                	</div>
	            	</div>
	            </div>
	            <div class="add_to_agenda"><a href="" title="">{l s='Ajouter à mon agenda' d='Shop.Theme.Customeraccount'}</a></div>
	            <div class="get_new_agenda"><a class="boutonstyle" href="" title="">{l s='Prendre un nouveau rdv' d='Shop.Theme.Customeraccount'}</a></div>
	        </div>
        </div>
	{/if}

	{if $cat == 'rib'}
                    
		<div class="mon_rib">
			<div class="custom_accountpage">
	            <div class="mon_rib_cover">
	            	<div class="account_page rib_page"> 
		            	<div class="pagetitle"> 
		                	<h1 class="page_title">
		                    	{l s='Mon RIB' d='Shop.Theme.Customeraccount'}
		                    </h1>
		                </div>
		            	<div class="mon_rib_cont">
		            		Vous n’avez pas encore enregistré de RIB pour transférer votre solde vers votre compte bancaire.
		            	</div>
		            	<div class="show_subpage add_rib"><span class="boutonstyle">{l s='Ajouter mon rib' d='Shop.Theme.Customeraccount'}</span></div>
		            </div>

	            	<div class="account_subpage" style="display: none;">
	                    <div class="pagetitle">
	                        <h1 class="page_title sub_page_title">
	                        	<span class="backtoprevpage"></span>
	                        	{l s='Ajouter mon RIB' d='Shop.Theme.Customeraccount'}
	                        </h1>
	                    </div>
	                    <div id="add_ribform" class="add_ribform">
		                    <form method="" action="" id="add-rib-form">
		                    	<div class="add_ribform_cover">
		                    		<p class="form_name">{l s='Compte bancaire' d='Shop.Theme.Customeraccount'}</p>
		                    		<div class="form-group row">
		                    			<div class="customfield">
		                    				<label class="label_field form-control-label{if $field.required} required{/if}" for="field-{$field.name}">{l s='BIC/SWIFT*' d='Shop.Theme.Customeraccount'}</label>
		                    				<input id="field-" class="form-control" name="" type="text" value="">
		                    			</div>
		                    		</div>
		                    		<div class="form-group row">
		                    			<div class="customfield">
		                    				<label class="label_field form-control-label{if $field.required} required{/if}" for="field-{$field.name}">{l s='Numéro IBAN*' d='Shop.Theme.Customeraccount'}</label>
		                    				<input id="field-" class="form-control" name="" type="text" value="">
		                    			</div>
		                    		</div>
		                    		<div class="form-group row">
		                    			<p>Your IBAN information is communicated directly in encrypted mode (SSL protocol) to a Secure Payment Provider who consults the banking servers to avoid abuse and fraud and gives MONOGRAM the payment authorization.<br> At no time is MONOGRAM in possession of the number you entered. To protect you from fraud, MONOGRAM has implemented an authentication security system.</p>
		                    		</div>
		                    	</div>
		                		<div class="form-group row submit_row">
		                			<button class="submit_my_rib boutonstyle form-control-submit" type="submit">{l s='Enregistrer mon rib' d='Shop.Theme.Actions'}</button>
		                		</div>
		                    </form>
		            	</div>
	            	</div>
	            </div>
            </div>
        </div>

	{/if}

	{if $cat == 'mpv'}
		<div class="mon_portefeuille">
			<div class="custom_accountpage">
	        	<div class="pagetitle"> 
	            	<h1 class="page_title">
	                	{l s='Mon portefeuille virtuel' d='Shop.Theme.Customeraccount'}
	                </h1>
	            </div>
	            <div class="monsolde">
	                <div class="monsolde_cover">
	                	<p class="solde_title">{l s='Votre solde est de :' d='Shop.Theme.Customeraccount'}</p>
	                	<p class="solde_amount">1 400,00€</p>
	                	<div class="solde_nature">ou <strong>1 470,00€ en bons d’achat</strong> <span class="solde_infos"></span></div>
	                </div>
	            </div>
	            <div class="convert_solde">
	                <p class="convert_to_bons">
	                	<a href="" title="" class="boutonstyle">{l s='Convertir en bon d\'achat' d='Shop.Theme.Customeraccount'}</a>
	                </p>
	            	<p>Gagnez + 5% de votre solde en le convertissant en bon d’achat !</p>
	            </div>
	            <div class="virement_bancaire">
	            	<a href="" title="">
	            		{l s='Ou' d='Shop.Theme.Customeraccount'}
	            		<span>{l s='effectuer un virement bancaire' d='Shop.Theme.Customeraccount'}</span>
	            	</a>
	            </div>
	            <div class="tabs_monogram tabsale_transferts">
	            	<ul class="tabs_links displayflex nav nav-tabs" role="tablist">
	            		<li class="nav-item" data-tab="#mesventes">
	            			<a
								class="nav-link active"
								data-toggle="tab"
								href="#mesventes"
								role="tab"
								aria-controls="mesventes">{l s='Mes ventes' d='Shop.Theme.Customeraccount'}</a>
	            		</li>
	            		<li class="nav-item">
	            			<a
								class="nav-link"
								data-toggle="tab"
								href="#mestransferts"
								role="tab"
								aria-controls="mestransferts">{l s='Mes Transferts' d='Shop.Theme.Customeraccount'}</a>
	            		</li>
	            	</ul>
	            	<div class="tab_content displayflex tab-content" id="tab-content">
	                	<div class="tab-pane fade in active" id="mesventes" role="tabpanel">
	                		<div class="tab-pane_cover displayflex">
	                    		<div class="tab_celt">
		                    		<div class="tab_celtcover displayflex">
		                    			<div class="elt_img"><img src="{$urls.img_url}/compte4.jpg" alt=""></div>
		                    			<div class="elt_texte displayflex">
			                    			<div class="elt_texte_top displayflex">
			                    				<div class="elt_desc">
			                    					<p class="elt_ref">Dépôt #456787</p>
			                    					<p>Sac BALENCIAGA-BB Chain</p>
			                    				</div>
			                    				<div class="elt_price">+ 600,00€</div>
			                    			</div>
		                    				<div class="elt_date">10/08/21</div>
		                    			</div>
		                    		</div>
	                    		</div>
	                    		<div class="tab_celt">
		                    		<div class="tab_celtcover displayflex">
		                    			<div class="elt_img"><img src="{$urls.img_url}/compte4.jpg" alt=""></div>
		                    			<div class="elt_texte displayflex">
			                    			<div class="elt_texte_top displayflex">
			                    				<div class="elt_desc">
			                    					<p class="elt_ref">Dépôt #456787</p>
			                    					<p>Sac BALENCIAGA-BB Chain</p>
			                    				</div>
			                    				<div class="elt_price">+ 600,00€</div>
			                    			</div>
		                    				<div class="elt_date">10/08/21</div>
		                    			</div>
		                    		</div>
	                    		</div>
	                    	</div>
	                	</div>
	                	<div class="mestransferts tab-pane fade in" id="mestransferts" role="tabpanel">
	                		<div class="tab-pane_cover displayflex">
	                    		<div class="tab_celt">
		                    		<div class="tab_celtcover">
		                    			<div class="elt_date">10/08/21</div>
		                    			<div class="elt_texte displayflex">
			                    			<div class="elt_texte_top displayflex">
			                    				<div class="elt_desc">
			                    					<p class="elt_ref">Dépôt #456787</p>
			                    					<p>Virement bancaire</p>
			                    				</div>
			                    				<div class="elt_price">- 600,00€</div>
			                    			</div>
		                    			</div>
		                    		</div>
	                    		</div>
	                    		<div class="tab_celt">
		                    		<div class="tab_celtcover">
		                    			<div class="elt_date">10/08/21</div>
		                    			<div class="elt_texte displayflex">
			                    			<div class="elt_texte_top displayflex">
			                    				<div class="elt_desc">
			                    					<p class="elt_ref">Vente Monogram #468002</p>
			                    					<p>Bons d’achats Monogram</p>
			                    				</div>
			                    				<div class="elt_price">- 600,00€</div>
			                    			</div>
		                    			</div>
		                    		</div>
	                    		</div>
	                    		<div class="tab_celt">
		                    		<div class="tab_celtcover">
		                    			<div class="elt_date">10/08/21</div>
		                    			<div class="elt_texte displayflex">
			                    			<div class="elt_texte_top displayflex">
			                    				<div class="elt_desc">
			                    					<p class="elt_ref">Vente Monogram #468002</p>
			                    					<p>Bons d’achats Monogram</p>
			                    				</div>
			                    				<div class="elt_price">- 600,00€</div>
			                    			</div>
		                    			</div>
		                    		</div>
	                    		</div>
	                    		<div class="tab_celt">
		                    		<div class="tab_celtcover">
		                    			<div class="elt_date">10/08/21</div>
		                    			<div class="elt_texte displayflex">
			                    			<div class="elt_texte_top displayflex">
			                    				<div class="elt_desc">
			                    					<p class="elt_ref">Vente Monogram #468002</p>
			                    					<p>Bons d’achats Monogram</p>
			                    				</div>
			                    				<div class="elt_price">- 600,00€</div>
			                    			</div>
		                    			</div>
		                    		</div>
	                    		</div>
	                    	</div>
	                	</div>
	            	</div>
	            </div>
	        </div>
        </div>
	{/if}

	{if $cat == 'depot'}
		<div class="mes_depots">
			<div class="custom_accountpage">
	        	<div class="account_page">
		        	<div class="pagetitle"> 
		            	<h1 class="page_title">
		                	{l s='Mes dépots' d='Shop.Theme.Customeraccount'}
		                </h1>
		            </div>
	            </div>
	            <div class="account_subpage" style="display: none;">
                    <div class="pagetitle">
                        <h1 class="page_title sub_page_title">
                        	<span class="backtoprevpage"></span>
                        	Dépôt #567890
                        </h1>
                    </div>
                    <div id="details_depot" class="details_depot"> 
                    	<div class="depot_status">{l s='Statut :' d='Shop.Theme.Actions'} <span style="color: #C77229;">En négociation</span></div>
                    	<div class="depot_name">BALENCIAGA</div>
                    	<div class="depot_short_desc">Sac BB Chain</div>

                    	<div class="alertexpedition" style="display: none;">
                    		<div class="merci_expedition">
                    			Merci d’avoir expédié votre article, nous attendons sa reception avec impatience ! Nous vous informerons dès qu’il est entre nos mains.
                    		</div>
                    		<div class="return_expedition" style="display: none;">
	                    		<div class="depot_elt displayflex contre_proposal_return">
	                				<div class="depot_elt_picture displayflex">
	                					<img src="{$urls.img_url}/compte4.jpg" alt="">
	                				</div>
						            <div class="depot_elt_desc displayflex">
							            <div class="depot_elt_text">
							              Votre article a été validé au prix de 580,00 € net pour vous !
							            </div>
							            <div class="depot_elt_date">Aujourd'hui</div>
							        </div>
							    </div>
							    <p style="padding-left: 90px;margin: 0;">
							    	Il est en train d’être photographié par notre équipe afin d’être mis en ligne au plus vite.
							    </p>
						    </div>
						    <div class="depot_inline depot_elt displayflex current" style="display: none;">
                				<div class="depot_elt_picture displayflex">
                					<img src="{$urls.img_url}/compte4.jpg" alt="">
                				</div>
					            <div class="depot_elt_desc displayflex">
						            <div class="depot_elt_text">
						              Votre article a été mis en ligne sur notre site !
						            </div>
						            <div class="depot_elt_date">Aujourd'hui</div>
						        </div>
						    </div>
						    <div class="depot_echec" style="display: none;">
							    <div class="depot_elt displayflex current" style="display: none;">
	                				<div class="depot_elt_picture displayflex">
	                					<img src="{$urls.img_url}/compte4.jpg" alt="">
	                				</div>
						            <div class="depot_elt_desc displayflex">
							            <div class="depot_elt_text">
							              Désolée, votre dépôt a échoué :
							              <div class="depot_elt_textvalue" style="font-style: italic;">Les photos n’ont pas chargées</div>
							            </div>
							            <div class="depot_elt_date">Aujourd'hui</div>
							        </div>
							    </div>
							    <div class="add_your_article">
							    	<strong class="boutonstyle">{l s='Modifier mon dépôt' d='Shop.Theme.Actions'}</strong>
							    </div>
						    </div>
                    	</div>

        				<div class="contre_proposal_notification">
	                    	<div class="counter_proposal_alert">
	                			{l s='Votre contre proposition a bien été prise en compte, notre équipe va vous répondre d’ici 24 heures.' d='Shop.Theme.Actions'}
	                		</div>
                			<div class="depot_elt displayflex contre_proposal_return">
                				<div class="depot_elt_picture displayflex">
                					<img src="{$urls.img_url}/compte4.jpg" alt="">
                				</div>
					            <div class="depot_elt_desc displayflex">
						            <div class="depot_elt_text">
						              Contre proposition de 560,00 € acceptée !
						            </div>
						            <div class="depot_elt_date">Aujourd'hui</div>
						        </div>
						    </div>
						    <div class="add_your_article">
						    	<span>{l s='Faites-nous parvenir votre article' d='Shop.Theme.Actions'}</span>
						    </div>
					    </div>

                    	<div class="depot_and_response">
	                    	<div class="depot_elt current displayflex">
	            				<div class="depot_elt_picture displayflex">
	            					<img src="{$urls.img_url}/compte4.jpg" alt="">
	            				</div>
					            <div class="depot_elt_desc displayflex">
						            <div class="depot_elt_text">
						              Proposition de prix pour votre dépôt :
						              <div class="depot_elt_textvalue">560,00 €</div>
						            </div>
						            <div class="depot_elt_date">17 juil.</div>
						        </div>
					        </div>

					        <!-- box statut de l'article -->
					        <div class="proces_de_depot box_envoiearticle" style="display: none;">
					        	<div class="expedition_box">
			                        <p class="poste_larticle">{l s='Faites-nous parvenir votre article.' d='Shop.Theme.Actions'}</p>
			                        <button type="button" data-toggle="modal" data-target="#modalexpedition">{l s='Comment expédier votre article ?' d='Shop.Theme.Actions'}</button>
			                        <div id="modalexpedition" class="modalexpedition modal fade" tabindex="-1" role="dialog" aria-hidden="true">
						                <div class="modal-dialog modal-dialog-centered" role="document">
						                    <div class="modal-content">
						                    	<button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
						                    	<div class="modal-body">
						                            <h3 class="expedition_title">{l s='Comment expédier votre article ?' d='Shop.Theme.Actions'}</h3>
						                            <div class="expedition_intro">
						                            	{l s='Pour nous faire parvenir votre article, deux possibilités s’offrent à vous :' d='Shop.Theme.Actions'}
						                            </div>
						                            <ul class="list_possibilite">
						                            	<li class="displayflex">
						                            		<strong>1.</strong>
						                            		<div class="desc">
						                            			<p class="desc_title">{l s='Par voie postale' d='Shop.Theme.Actions'}</p>
						                            			<p style="font-family: 'ApercuLight';">{l s='En adressant votre colis* à l’adresse suivante :' d='Shop.Theme.Actions'}</p>
						                            			<p style="font-size: 18px;line-height: 22px;color: #000;">
						                            				SBL-MNGRM<br> 6, rue de la Trémoille<br> 75008 Paris
						                            			</p>
						                            		</div>
						                            	</li>
						                            	<li class="displayflex">
						                            		<strong>2.</strong>
						                            		<div class="desc">
						                            			<p class="desc_title">{l s='EN PRENANT RENDEZ-VOUS DANS NOTRE SHOWROOM PARISIEN' d='Shop.Theme.Actions'}</p>
						                            			<div class="takerdv">
						                            				<a href="" title=""><span>{l s='Prendre rendez-vous' d='Shop.Theme.Actions'}</span></a>
						                            			</div>
						                            		</div>
						                            	</li>
						                            </ul>
						                        </div>
						                    </div>
						                </div>
						            </div>
			                    </div>
					        	<form class="response_form">
							        <div class="choix_answer form-group row">
							        	<label class="response_label">{l s='Statut de l’envoi de votre article' d='Shop.Theme.Actions'}</label>
							        	<ul class="list_reponse">
							        		<li>
							        			<label class="radio-inline displayflex" for="response_1">
									              	<span class="custom-radio">
									                <input
									                        name="response_1"
									                        id="response_1"
									                        type="radio"
									                        value=""
									                        {if $field.required}required{/if}
									                >
									                <span></span>
									              	</span>
									              	<span class="customradio_texte">
						                            	<strong class="option">{l s='Article expédié' d='Shop.Theme.Actions'}</strong>
						                            	<small >{l s='Vous avez bien envoyé votre article par voie postale, vous possédez un numéro de colis' d='Shop.Theme.Actions'}</small>
									              	</span>
						                        </label>
							        		</li>
							        		<li>
							        			<label class="radio-inline displayflex" for="response_2">
									              	<span class="custom-radio">
										                <input
										                        name="response_2"
										                        id="response_2"
										                        type="radio"
										                        value=""
										                        {if $field.required}required{/if}
										                >
										                <span></span>
									              	</span>
									              	<span class="customradio_texte">
							                            <strong class="option">{l s='Confirmation de RDV au showroom' d='Shop.Theme.Actions'}</strong>
							                            <small >{l s='Vous avez pris rendez-vous dans notre showroom parisien pour déposer votre article' d='Shop.Theme.Actions'}</small>
							                        </span>
						                        </label>
							        		</li>
							        	</ul>
							        </div>

							        <div class="form-group row prixnetsouhaite">
		                    			<div class="customfield">
		                    				<label class="label_field form-control-label required" for="prixnetsouhaite">
		                    						{l s='Numéro de suivi du colis*' d='Shop.Theme.Customeraccount'}
		                    				</label>
		                    				<input id="prixnetsouhaite" class="form-control depot_control" name="" type="text" value="">
		                    			</div>
		                    		</div>

							        <div class="form-group row submit_row">
		                    			<span class="button_contre boutonstyle form-control-submit">{l s='Validez le mode d’expédition' d='Shop.Theme.Actions'}</span>
		                    		</div>
		                    	</form>
					        </div>

					        <!-- box réponse -->
					        <div class="response_proposition proces_de_depot">
					        	<form class="response_form">
							        <div class="choix_answer form-group row">
							        	<label class="response_label">{l s='Votre réponse' d='Shop.Theme.Actions'}</label>
							        	<ul class="list_reponse">
							        		<li>
							        			<label class="radio-inline displayflex" for="response_1">
									              	<span class="custom-radio">
									                <input
									                        name="response_1"
									                        id="response_1"
									                        type="radio"
									                        value=""
									                        {if $field.required}required{/if}
									                >
									                <span></span>
									              	</span>
									              	<span class="customradio_texte">
						                            	<strong class="option">{l s='Accepted price' d='Shop.Theme.Actions'}</strong>
						                            	<small >{l s='Accept our quotation for your deposit and sell quickly at the right price' d='Shop.Theme.Actions'}</small>
									              	</span>
						                        </label>
							        		</li>
							        		<li>
							        			<label class="radio-inline displayflex" for="response_2">
									              	<span class="custom-radio">
										                <input
										                        name="response_2"
										                        id="response_2"
										                        type="radio"
										                        value=""
										                        {if $field.required}required{/if}
										                >
										                <span></span>
									              	</span>
									              	<span class="customradio_texte">
							                            <strong class="option">{l s='Counter proposal of price' d='Shop.Theme.Actions'}</strong>
							                            <small >{l s='Refuse the price proposed by Monogram and make a counter proposal with a new price for your deposit' d='Shop.Theme.Actions'}</small>
							                        </span>
						                        </label>
							        		</li>
							        		<li>
							        			<label class="radio-inline displayflex" for="response_3">
									              	<span class="custom-radio">
										                <input
										                        name="response_3"
										                        id="response_3"
										                        type="radio"
										                        value=""
										                        {if $field.required}required{/if}
										                >
										                <span></span>
									              	</span>
									              	<span class="customradio_texte">
							                            <strong class="option">{l s='Cancel your deposit' d='Shop.Theme.Actions'}</strong>
							                            <small >{l s='Refuse the price offered by Monogram and cancel your deposit request' d='Shop.Theme.Actions'}</small>
							                        </span>
						                        </label>
							        		</li>
							        	</ul>
							        </div>

							        <div class="form-group row prixnetsouhaite">
		                    			<div class="customfield">
		                    				<label class="label_field form-control-label required" for="prixnetsouhaite">{l s='Prix net souhaité*' d='Shop.Theme.Customeraccount'}</label>
		                    				<input id="prixnetsouhaite" class="form-control depot_control" name="" type="text" value="">
		                    			</div>
		                    		</div>

							        <div class="form-group row response_row">
		                    			<span class="button_repondre boutonstyle form-control-submit disabled">{l s='Répondre' d='Shop.Theme.Actions'}</span>
		                    		</div>

							        <div class="form-group row submit_row">
		                    			<span class="button_contre boutonstyle form-control-submit">{l s='Faire une contre proposition' d='Shop.Theme.Actions'}</span>
		                    		</div>
		                    	</form>
					        </div>
				        </div>

                    	<div class="description_depot boxtab">
                    		<label class="boxtab_title">{l s='Article description' d='Shop.Theme.Actions'}</label>
                    		<div class="boxtab_content">
                    			Contenu de la description
                    		</div>
                    	</div>

                    	<div class="booster_lavente">
                    		<span class="custom-checkbox">
					            <label>
					              	<input name="{$field.name}" type="checkbox" value="1" {if $field.value}checked="checked"{/if} {if $field.required}required{/if}>
					              	<span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
					              	<strong>{l s='Booster la vente de votre article' d='Shop.Theme.Actions'}</strong>
					              	<small>Acceptez de baisser le prix de votre article de 10% après 30 jours de mise en ligne sur notre site afin de lui donner plus de chance de trouver un acheteur.</small>
					            </label>
					        </span>
                    	</div>
                    	<div class="depot_story boxtab">
                    		<label class="boxtab_title">{l s='Depot story' d='Shop.Theme.Actions'}</label>
                    		<div class="boxtab_content">
                    			<div class="depot_elt displayflex current">
                    				<div class="depot_elt_picture displayflex">
                    					<img src="{$urls.img_url}/compte4.jpg" alt="">
                    				</div>
						            <div class="depot_elt_desc displayflex">
							            <div class="depot_elt_text">
							              Proposition de prix pour votre dépôt :
							              <div class="depot_elt_textvalue">560,00 €</div>
							            </div>
							            <div class="depot_elt_date">17 juil.</div>
							        </div>
						        </div>
                    			<div class="depot_elt displayflex">
                    				<div class="depot_elt_picture displayflex">
                    					<img src="{$urls.img_url}/compte4.jpg" alt="">
                    				</div>
						            <div class="depot_elt_desc displayflex">
							            <div class="depot_elt_text">
							              Demande de dépôt
							              <div class="depot_elt_textvalue">Prix souhaité : 600,00 €</div>
							            </div>
							            <div class="depot_elt_date">17 juil.</div>
							        </div>
						        </div>
                    		</div>
                    	</div>
                    </div>
        		</div>
	            <div class="list_demesdepots">
	                <div class="list_demesdepots_cover">
	                	<div class="depot_head_title">Dépôts <span>en cours</span></div>
	                    <div class="mesdepots_encours">
		                    <div class="mesdepots_elt">
		                    	<div class="depot_top displayflex">
		                    		<div class="depot_refand_date">#567890 - {l s='Le' d='Shop.Theme.Actions'} 10/08/2021</div>
		                    		<div class="view_depot show_subpage"><span>{l s='Voir le dépôt >' d='Shop.Theme.Actions'}</span></div>
		                    	</div>
			                    <div class="depot_center displayflex">
	                    			<div class="depot_img">
	                    				<a href="#" title="#"><img src="{$urls.img_url}/compte4.jpg" alt=""></a>
	                    			</div>
	                    			<div class="depot_right displayflex">
	                    				<div class="depot_infos">
	                    					<div class="depot_title"><a href="" title="#">{l s='Balenciaga' d='Shop.Theme.Actions'}</a></div>
	                    					<div class="depot_desc"><a href="" title="#">{l s='BB Chain' d='Shop.Theme.Actions'}</a></div>
	                    					<div class="depot_quality">{l s='Très bon état' d='Shop.Theme.Actions'}</div>
	                    				</div>
	                    				<div class="depot_price_and_status displayflex">
	                    					<div class="depot_price">{l s='Prix souhaité :' d='Shop.Theme.Actions'} 600 €</div>
	                    					<div class="depot_status">{l s='Statut :' d='Shop.Theme.Actions'} <span style="color: #C77229">En cours de négociation</span></div>
	                    				</div>
	                    			</div>
		                    	</div>
		                    	<div class="depot_bottom displayflex">
		                    		<div class="depot_price displayflex">{l s='Proposition de prix :' d='Shop.Theme.Actions'} <span>560,00 €</span></div>
		                    		<div class="accept_link"><a class="boutonstyle displayflex" href="" title="{l s='Accepter' d='Shop.Theme.Actions'}">{l s='Accepter' d='Shop.Theme.Actions'}</a></div>
		                    	</div>
	                    	</div>
		                    <div class="mesdepots_elt">
		                    	<div class="depot_top displayflex">
		                    		<div class="depot_refand_date">#567890 - {l s='Le' d='Shop.Theme.Actions'} 10/08/2021</div>
		                    		<div class="view_depot"><a href="#" title="#">{l s='Voir le dépôt >' d='Shop.Theme.Actions'}</a></div>
		                    	</div>
			                    <div class="depot_center displayflex">
	                    			<div class="depot_img">
	                    				<a href="#" title="#"><img src="{$urls.img_url}/compte4.jpg" alt=""></a>
	                    			</div>
	                    			<div class="depot_right displayflex">
	                    				<div class="depot_infos">
	                    					<div class="depot_title"><a href="" title="#">Louis Vuitton</a></div>
	                    					<div class="depot_desc"><a href="" title="#"></a></div>
	                    					<div class="depot_quality">{l s='Très bon état' d='Shop.Theme.Actions'}</div>
	                    				</div>
	                    				<div class="depot_price_and_status displayflex">
	                    					<div class="depot_price">{l s='Prix net :' d='Shop.Theme.Actions'} 1000 €</div>
	                    					<div class="depot_status">{l s='Statut :' d='Shop.Theme.Actions'} <span style="color: #57A073">En ligne</span></div>
	                    				</div>
	                    			</div>
		                    	</div>
		                    	<!--<div class="depot_bottom displayflex">
		                    		<div class="depot_price displayflex">{l s='Proposition de prix :' d='Shop.Theme.Actions'} <span>560,00 €</span></div>
		                    		<div class="accept_link"><a class="boutonstyle displayflex" href="" title="{l s='Accepter' d='Shop.Theme.Actions'}">{l s='Accepter' d='Shop.Theme.Actions'}</a></div>
		                    	</div>-->
	                    	</div>
	                	</div>
	                </div>
	                <div class="list_demesdepots">
	                	<div class="depot_head_title">Dépôts <span>vendus</span></div>
	                    <div class="mesdepots_encours">
		                    <div class="mesdepots_elt">
		                    	<div class="depot_top displayflex">
		                    		<div class="depot_refand_date">#890031 - {l s='Le' d='Shop.Theme.Actions'} 20/05/2021</div>
		                    		<div class="view_depot"><a href="#" title="#">{l s='Voir le dépôt >' d='Shop.Theme.Actions'}</a></div>
		                    	</div>
			                    <div class="depot_center displayflex">
	                    			<div class="depot_img">
	                    				<a href="#" title="#"><img src="{$urls.img_url}/compte4.jpg" alt=""></a>
	                    			</div>
	                    			<div class="depot_right displayflex">
	                    				<div class="depot_infos">
	                    					<div class="depot_title"><a href="" title="#">DIOR</a></div>
	                    					<div class="depot_desc"><a href="" title="#">MINI SAC POCHETTE Très bon état</a></div>
	                    					<div class="depot_quality">{l s='Très bon état' d='Shop.Theme.Actions'}</div>
	                    				</div>
	                    				<div class="depot_price_and_status displayflex">
	                    					<div class="depot_price">{l s='Prix net vendeur :' d='Shop.Theme.Actions'} 380 €</div>
	                    					<div class="depot_status">{l s='Statut :' d='Shop.Theme.Actions'} <span style="color: #000">En ligne</span></div>
	                    				</div>
	                    			</div>
		                    	</div>
		                    	<!--<div class="depot_bottom displayflex">
		                    		<div class="depot_price displayflex">{l s='Proposition de prix :' d='Shop.Theme.Actions'} <span>560,00 €</span></div>
		                    		<div class="accept_link"><a class="boutonstyle displayflex" href="" title="{l s='Accepter' d='Shop.Theme.Actions'}">{l s='Accepter' d='Shop.Theme.Actions'}</a></div>
		                    	</div>-->
	                    	</div>
	                	</div>
	                </div>
	            </div>
            </div>
        </div>
	{/if}

	{if $cat == 'liste'}
		<div class="mes_envies">
	        <div class="mes_envies_cover">
	        	<div class="pagetitle"> 
	            	<h1 class="page_title">
	                	{l s='Ma wishlist' d='Shop.Theme.Customeraccount'}
	                </h1>
	            </div>
	            <div class="pageintro">
	            	{l s='Sauvegardez vos articles coup de coeur mais n’oubliez pas que nos produits sont des pièces uniques, faites vite !' d='Shop.Theme.Customeraccount'}
	            </div>
	        	<div class="mes_envies_cont">
	        		Listing produits
	        	</div>
	        </div>
	    </div>
	{/if}
	{if $cat == 'alertes'}
		Alerte
	{/if}
	{if $cat == 'pea'}
		<div class="personnalisation">
			<div class="custom_accountpage">
				<div id="step_1" class="step current">
					<div class="box_title">
						<h1 class="step_title">{l s='PERSONNALISEZ VOTRE EXPÉRIENCE D’ACHAT' d='Shop.Theme.Actions'}</h1>
						<p class="step_subtitle">{l s='Quelle(s) marque(s) recherchez-vous ?' d='Shop.Theme.Actions'}</p>
						<div class="step_desc">{l s='(Plusieurs choix sont possibles)' d='Shop.Theme.Actions'}</div>
					</div>
					<div class="box_search">
						<form class="" action="" method="">
                			<div class="customfield">
                				<label class="label_field form-control-label{if $field.required} required{/if}" for="field-{$field.name}">{l s='Designers' d='Shop.Theme.Customeraccount'}</label>
                				<input id="field-" class="form-control" name="" type="text" value="">
                			</div>
	                		<button class="form-control-submit" type="submit">{l s='rechercher' d='Shop.Theme.Actions'}</button>
	                	</form>
					</div>
					<div class="box_results_search">
						<div class="group_results">
							<h2 class="title_results">A</h2>
							<div class="results_list">
								<ul class="displayflex">
									<li><a href="" title="">ALEXANDER MCQUEEN</a></li>
									<li><a href="" title="">ALAIA</a></li>
									<li><a href="" title="">ALEXANDER WANG</a></li>
									<li><a href="" title="">AQUAZZURA</a></li>
								</ul>
							</div>
						</div>
						<div class="group_results">
							<h2 class="title_results">B</h2>
							<div class="results_list">
								<ul class="displayflex">
									<li><a href="" title="">BALENCIAGA</a></li>
									<li><a href="" title="">BULGARI</a></li>
									<li><a href="" title="">BALMAIN</a></li>
									<li><a href="" title="">BOTTEGA VENETA</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="next_step">
						<a class="next" href="#step_2">{l s='Suivant' d='Shop.Theme.Actions'}</a>
					</div>
				</div>
				<div id="step_2" class="step">
					<div class="box_title">
						<h1 class="step_title">{l s='PERSONNALISEZ VOTRE EXPÉRIENCE D’ACHAT' d='Shop.Theme.Actions'}</h1>
						<p class="step_subtitle">{l s='Quelle(s) marque(s) recherchez-vous ?' d='Shop.Theme.Actions'}</p>
						<div class="step_desc">{l s='(Plusieurs choix sont possibles)' d='Shop.Theme.Actions'}</div>
					</div>
					<div class="box_search">
						<form class="" action="" method="">
                			<div class="customfield">
                				<label class="label_field form-control-label{if $field.required} required{/if}" for="field-{$field.name}">{l s='Designers' d='Shop.Theme.Customeraccount'}</label>
                				<input id="field-" class="form-control" name="" type="text" value="">
                			</div>
	                		<button class="form-control-submit" type="submit">{l s='rechercher' d='Shop.Theme.Actions'}</button>
	                	</form>
					</div>
					<div class="box_select_results">
						<ul class="displayflex">
							<li>GUCCI<span class="remove"></span></li>
							<li>PRADA<span class="remove"></span></li>
						</ul>
					</div>
					<div class="box_results_search">
						<div class="group_results">
							<h2 class="title_results">A</h2>
							<div class="results_list">
								<ul class="displayflex">
									<li><a href="" title="">ALEXANDER MCQUEEN</a></li>
									<li><a href="" title="">ALAIA</a></li>
									<li><a href="" title="">ALEXANDER WANG</a></li>
									<li><a href="" title="">AQUAZZURA</a></li>
								</ul>
							</div>
						</div>
						<div class="group_results">
							<h2 class="title_results">B</h2>
							<div class="results_list">
								<ul class="displayflex">
									<li><a href="" title="">BALENCIAGA</a></li>
									<li><a href="" title="">BULGARI</a></li>
									<li><a href="" title="">BALMAIN</a></li>
									<li><a href="" title="">BOTTEGA VENETA</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="next_step">
						<a class="next" href="#step_3">{l s='Suivant' d='Shop.Theme.Actions'}</a>
					</div>
				</div>
				<div id="step_3" class="step">
					<div class="box_title">
						<h1 class="step_title">{l s='PERSONNALISEZ VOTRE EXPÉRIENCE D’ACHAT' d='Shop.Theme.Actions'}</h1>
						<p class="step_subtitle">{l s='Quel(s) type(s) d’article(s) recherchez-vous ?' d='Shop.Theme.Actions'}</p>
						<div class="step_desc">{l s='(Plusieurs choix sont possibles)' d='Shop.Theme.Actions'}</div>
					</div>
					<div class="box_list_articles">
				        <div class="article col-xs-12 col-sm-6 col-md-6">
				          	<div class="article_cover">
					            <div class="article_img">
					              <a href="" title="">
					                <img src="{$urls.img_url}/update/bijoux.jpg" alt="">
					              </a>
					            </div>
					            <div class="article_title">
					              <a href="" title="">{l s='Bijoux' d='Shop.Theme.Global'}</a>
					          	</div>
				          	</div>
				        </div>
				        <div class="article col-xs-12 col-sm-6 col-md-6">
				          	<div class="article_cover">
					            <div class="article_img">
					              <a href="" title="">
					                <img src="{$urls.img_url}/update/chaussures.jpg" alt="">
					              </a>
					            </div>
					            <div class="article_title">
					              <a href="" title="">{l s='Chaussures' d='Shop.Theme.Global'}</a>
					          	</div>
				          	</div>
				        </div>
				        <div class="article col-xs-12 col-sm-6 col-md-6">
				          	<div class="article_cover">
					            <div class="article_img">
					              <a href="" title="">
					                <img src="{$urls.img_url}/update/accessoires.jpg" alt="">
					              </a>
					            </div>
					            <div class="article_title">
					              <a href="" title="">{l s='Sacs' d='Shop.Theme.Global'}</a>
					          	</div>
				          	</div>
				        </div>
				        <div class="article col-xs-12 col-sm-6 col-md-6">
				          	<div class="article_cover">
					            <div class="article_img">
					              <a href="" title="">
					                <img src="{$urls.img_url}/update/pretaporter.jpg" alt="">
					              </a>
					            </div>
					            <div class="article_title">
					              <a href="" title="">{l s='Prêt-à-porter' d='Shop.Theme.Global'}</a>
					          	</div>
				          	</div>
				        </div>
					</div>
					<div class="next_step">
						<a class="next" href="#step_4">{l s='Suivant' d='Shop.Theme.Actions'}</a>
					</div>
				</div>
				<div id="step_4" class="step">
					<div class="box_title">
						<h1 class="step_title">{l s='PERSONNALISEZ VOTRE EXPÉRIENCE D’ACHAT' d='Shop.Theme.Actions'}</h1>
						<p class="step_subtitle">{l s='Quel(s) style(s) recherchez-vous ?' d='Shop.Theme.Actions'}</p>
						<div class="step_desc">{l s='(Plusieurs choix sont possibles)' d='Shop.Theme.Actions'}</div>
					</div>
					<div class="box_list_articles box_list_modeles">
				        <div class="article col-xs-12 col-sm-6 col-md-6">
				          	<div class="article_cover">
					            <div class="article_img">
					              <a href="" title="">
					                <img src="{$urls.img_url}/update/bijoux.jpg" alt="">
					              </a>
					            </div>
					            <div class="article_title">
					              <a href="" title="">{l s='Bijoux' d='Shop.Theme.Global'}</a>
					          	</div>
				          	</div>
				        </div>
				        <div class="article col-xs-12 col-sm-6 col-md-6">
				          	<div class="article_cover">
					            <div class="article_img">
					              <a href="" title="">
					                <img src="{$urls.img_url}/update/chaussures.jpg" alt="">
					              </a>
					            </div>
					            <div class="article_title">
					              <a href="" title="">{l s='Chaussures' d='Shop.Theme.Global'}</a>
					          	</div>
				          	</div>
				        </div>
				        <div class="article col-xs-12 col-sm-6 col-md-6">
				          	<div class="article_cover">
					            <div class="article_img">
					              <a href="" title="">
					                <img src="{$urls.img_url}/update/accessoires.jpg" alt="">
					              </a>
					            </div>
					            <div class="article_title">
					              <a href="" title="">{l s='Sacs' d='Shop.Theme.Global'}</a>
					          	</div>
				          	</div>
				        </div>
				        <div class="article col-xs-12 col-sm-6 col-md-6">
				          	<div class="article_cover">
					            <div class="article_img">
					              <a href="" title="">
					                <img src="{$urls.img_url}/update/pretaporter.jpg" alt="">
					              </a>
					            </div>
					            <div class="article_title">
					              <a href="" title="">{l s='Prêt-à-porter' d='Shop.Theme.Global'}</a>
					          	</div>
				          	</div>
				        </div>
					</div>
					<div class="next_step">
						<a href="#" title="{l s='Explorez !' d='Shop.Theme.Actions'}" class="boutonstyle">{l s='Explorez !' d='Shop.Theme.Actions'}</a>
					</div>
				</div>
			</div>
		</div>
	{/if} 
	
	<div class="mon_rib" style="display: none;">
	                    <div class="mon_rib_cover">
	                    	<div class="pagetitle"> 
		                    	<h1 class="page_title">
		                        	{l s='Mon RIB' d='Shop.Theme.Customeraccount'}
		                        </h1>
		                    </div>
	                    	<div class="mon_rib_cont">
	                    		Vous n’avez pas encore enregistré de RIB pour transférer votre solde vers votre compte bancaire.
	                    	</div>
	                    	<div class="add_rib"><a href="" title="" class="boutonstyle">{l s='Ajouter mon rib' d='Shop.Theme.Customeraccount'}</a></div>

	                    	<div class="add_ribform">
			                    <form method="" action="" id="add-rib-form">
			                    	<div class="add_ribform_cover">
			                    		<p class="form_name">{l s='Compte bancaire' d='Shop.Theme.Customeraccount'}</p>
			                    		<div class="form-group row">
			                    			<div class="customfield">
			                    				<label class="label_field form-control-label{if $field.required} required{/if}" for="field-{$field.name}">{l s='BIC/SWIFT*' d='Shop.Theme.Customeraccount'}</label>
			                    				<input id="field-" class="form-control" name="" type="text" value="">
			                    			</div>
			                    		</div>
			                    		<div class="form-group row">
			                    			<div class="customfield">
			                    				<label class="label_field form-control-label{if $field.required} required{/if}" for="field-{$field.name}">{l s='Numéro IBAN*' d='Shop.Theme.Customeraccount'}</label>
			                    				<input id="field-" class="form-control" name="" type="text" value="">
			                    			</div>
			                    		</div>
			                    		<div class="form-group row">
			                    			<p>Your IBAN information is communicated directly in encrypted mode (SSL protocol) to a Secure Payment Provider who consults the banking servers to avoid abuse and fraud and gives MONOGRAM the payment authorization.<br> At no time is MONOGRAM in possession of the number you entered. To protect you from fraud, MONOGRAM has implemented an authentication security system.</p>
			                    		</div>
			                    	</div>
		                    		<div class="form-group row submit_row">
		                    			<button class="submit_my_rib boutonstyle form-control-submit" type="submit">{l s='Enregistrer mon rib' d='Shop.Theme.Actions'}</button>
		                    		</div>
			                    </form>
	                    	</div>
	                    </div>
                    </div>

                    <div class="mon_portefeuille" style="display: none;">
                    	<div class="pagetitle"> 
	                    	<h1 class="page_title">
	                        	{l s='Mon portefeuille virtuel' d='Shop.Theme.Customeraccount'}
	                        </h1>
	                    </div>
	                    <div class="monsolde">
		                    <div class="monsolde_cover">
		                    	<p class="solde_title">{l s='Votre solde est de :' d='Shop.Theme.Customeraccount'}</p>
		                    	<p class="solde_amount">1 400,00€</p>
		                    	<div class="solde_nature">ou <strong>1 470,00€ en bons d’achat</strong> <span class="solde_infos"></span></div>
		                    </div>
	                    </div>
	                    <div class="convert_solde">
		                    <p class="convert_to_bons">
		                    	<a href="" title="" class="boutonstyle">{l s='Convertir en bon d\'achat' d='Shop.Theme.Customeraccount'}</a>
		                    </p>
	                    	<p>Gagnez + 5% de votre solde en le convertissant en bon d’achat !</p>
	                    </div>
	                    <div class="virement_bancaire">
	                    	<a href="" title="">
	                    		{l s='Ou' d='Shop.Theme.Customeraccount'}
	                    		<span>{l s='effectuer un virement bancaire' d='Shop.Theme.Customeraccount'}</span>
	                    	</a>
	                    </div>
	                    <div class="tabs_monogram tabsale_transferts">
	                    	<ul class="tabs_links displayflex nav nav-tabs" role="tablist">
	                    		<li class="nav-item" data-tab="#mesventes">
	                    			<a
										class="nav-link active"
										data-toggle="tab"
										href="#mesventes"
										role="tab"
										aria-controls="mesventes">{l s='Mes ventes' d='Shop.Theme.Customeraccount'}</a>
	                    		</li>
	                    		<li class="nav-item">
	                    			<a
										class="nav-link"
										data-toggle="tab"
										href="#mestransferts"
										role="tab"
										aria-controls="mestransferts">{l s='Mes Transferts' d='Shop.Theme.Customeraccount'}</a>
	                    		</li>
	                    	</ul>
	                    	<div class="tab_content displayflex tab-content" id="tab-content">
		                    	<div class="tab-pane fade in active" id="mesventes" role="tabpanel">
		                    		<div class="tab-pane_cover displayflex">
			                    		<div class="tab_celt">
				                    		<div class="tab_celtcover displayflex">
				                    			<div class="elt_img"><img src="{$urls.img_url}/compte4.jpg" alt=""></div>
				                    			<div class="elt_texte displayflex">
					                    			<div class="elt_texte_top displayflex">
					                    				<div class="elt_desc">
					                    					<p class="elt_ref">Dépôt #456787</p>
					                    					<p>Sac BALENCIAGA-BB Chain</p>
					                    				</div>
					                    				<div class="elt_price">+ 600,00€</div>
					                    			</div>
				                    				<div class="elt_date">10/08/21</div>
				                    			</div>
				                    		</div>
			                    		</div>
			                    		<div class="tab_celt">
				                    		<div class="tab_celtcover displayflex">
				                    			<div class="elt_img"><img src="{$urls.img_url}/compte4.jpg" alt=""></div>
				                    			<div class="elt_texte displayflex">
					                    			<div class="elt_texte_top displayflex">
					                    				<div class="elt_desc">
					                    					<p class="elt_ref">Dépôt #456787</p>
					                    					<p>Sac BALENCIAGA-BB Chain</p>
					                    				</div>
					                    				<div class="elt_price">+ 600,00€</div>
					                    			</div>
				                    				<div class="elt_date">10/08/21</div>
				                    			</div>
				                    		</div>
			                    		</div>
			                    	</div>
		                    	</div>
		                    	<div class="mestransferts tab-pane fade in" id="mestransferts" role="tabpanel">
		                    		<div class="tab-pane_cover displayflex">
			                    		<div class="tab_celt">
				                    		<div class="tab_celtcover">
				                    			<div class="elt_date">10/08/21</div>
				                    			<div class="elt_texte displayflex">
					                    			<div class="elt_texte_top displayflex">
					                    				<div class="elt_desc">
					                    					<p class="elt_ref">Dépôt #456787</p>
					                    					<p>Virement bancaire</p>
					                    				</div>
					                    				<div class="elt_price">- 600,00€</div>
					                    			</div>
				                    			</div>
				                    		</div>
			                    		</div>
			                    		<div class="tab_celt">
				                    		<div class="tab_celtcover">
				                    			<div class="elt_date">10/08/21</div>
				                    			<div class="elt_texte displayflex">
					                    			<div class="elt_texte_top displayflex">
					                    				<div class="elt_desc">
					                    					<p class="elt_ref">Vente Monogram #468002</p>
					                    					<p>Bons d’achats Monogram</p>
					                    				</div>
					                    				<div class="elt_price">- 600,00€</div>
					                    			</div>
				                    			</div>
				                    		</div>
			                    		</div>
			                    		<div class="tab_celt">
				                    		<div class="tab_celtcover">
				                    			<div class="elt_date">10/08/21</div>
				                    			<div class="elt_texte displayflex">
					                    			<div class="elt_texte_top displayflex">
					                    				<div class="elt_desc">
					                    					<p class="elt_ref">Vente Monogram #468002</p>
					                    					<p>Bons d’achats Monogram</p>
					                    				</div>
					                    				<div class="elt_price">- 600,00€</div>
					                    			</div>
				                    			</div>
				                    		</div>
			                    		</div>
			                    		<div class="tab_celt">
				                    		<div class="tab_celtcover">
				                    			<div class="elt_date">10/08/21</div>
				                    			<div class="elt_texte displayflex">
					                    			<div class="elt_texte_top displayflex">
					                    				<div class="elt_desc">
					                    					<p class="elt_ref">Vente Monogram #468002</p>
					                    					<p>Bons d’achats Monogram</p>
					                    				</div>
					                    				<div class="elt_price">- 600,00€</div>
					                    			</div>
				                    			</div>
				                    		</div>
			                    		</div>
			                    	</div>
		                    	</div>
	                    	</div>
	                    </div>
                    </div>
                    
                    <div class="mes_rdv" style="display: none;">
                    	<div class="pagetitle"> 
	                    	<h1 class="page_title">
	                        	{l s='Mes rendez-vous en cours' d='Shop.Theme.Customeraccount'}
	                        </h1>
	                    </div>
	                    <div class="mes_rdv_cover displayflex">
	                    	<div class="rdv_item">
		                    	<div class="rdv_itemcover">
	                    			<div class="rdv_desc">
	                    				<p class="rdv_title">Rendez-vous au showroom Paris 8e</p>
	                    				<p><span>{l s='Le :' d='Shop.Theme.Customeraccount'}</span> Lundi 30 août 2021</p>
	                    				<p><span>{l s='À :' d='Shop.Theme.Customeraccount'}</span> 10h15</p>
	                    				<p><span>{l s='Motif :' d='Shop.Theme.Customeraccount'}</span> Acheter un article</p>
	                    			</div>
	                    			<div class="rdv_link displayflex">
	                    				<a href="" title="{l s='Modifier le rdv' d='Shop.Theme.Customeraccount'}">{l s='Modifier le rdv' d='Shop.Theme.Customeraccount'}</a>
	                    				<a href="" title="{l s='Annuler le rdv' d='Shop.Theme.Customeraccount'}">{l s='Annuler le rdv' d='Shop.Theme.Customeraccount'}</a>
	                    			</div>
		                    	</div>
	                    	</div>
	                    </div>
	                    <div class="add_to_agenda"><a href="" title="">{l s='Ajouter à mon agenda' d='Shop.Theme.Customeraccount'}</a></div>
	                    <div class="get_new_agenda"><a class="boutonstyle" href="" title="">{l s='Prendre un nouveau rdv' d='Shop.Theme.Customeraccount'}</a></div>
                    </div>

                    <div class="mes_bondereductions" style="display: none;">
                    	<div class="pagetitle"> 
	                    	<h1 class="page_title">
	                        	{l s='Mes bons de réductions' d='Shop.Theme.Customeraccount'}
	                        </h1>
	                    </div>
	                    <div class="bondereductions">
	                    	<div class="reduction_elt displayflex">
                    			<div class="bon_desc">
                    				70€ d’achat offert sur le site en convertissant votre solde de 1400€ sur votre portefeuille virtuel
                    			</div>
                    			<div class="bon_date">Il y a 2 jours</div>
	                    	</div>
	                    	<div class="reduction_elt displayflex">
                    			<div class="bon_desc">
                    				-10% sur tous les articles de la marque CHANEL avec le code CHANEL10.
                    			</div>
                    			<div class="bon_date">Il y a 2 mois</div>
	                    	</div>
	                    	<div class="reduction_elt displayflex">
                    			<div class="bon_desc">
                    				-15% sur votre 1ère commande avec le code WELCOMEMNG
                    			</div>
                    			<div class="bon_date">Il y a 1 mois</div>
	                    	</div>
	                    </div>
                    </div>

                    <div class="mes_bons_dachats" style="display: none;">
                    	<div class="pagetitle"> 
	                    	<h1 class="page_title">
	                        	{l s='Mes bons d’achat' d='Shop.Theme.Customeraccount'}
	                        </h1>
	                    </div>
	                    <div class="list_bons_dachats">
		                    <div class="bondachat_elt">
		                    	<div class="bondachat_date">10/08/21</div>
			                    <div class="bondachat_elt_cover displayflex">
	                    			<div class="bondachat_desc">
	                    				<div class="bnd_title">Solde converti</div>
	                    				<div class="bnd_desc">Bon d’achat Monogram</div>
	                    			</div>
	                    			<div class="bondachat_price">+ 600,00€</div>
		                    	</div>
	                    	</div>
		                    <div class="bondachat_elt">
		                    	<div class="bondachat_date">23/06/21</div>
			                    <div class="bondachat_elt_cover displayflex">
	                    			<div class="bondachat_desc">
	                    				<div class="bnd_title">Vente Dépôt #456787</div>
	                    				<div class="bnd_desc">Bon d’achat Monogram</div>
	                    			</div>
	                    			<div class="bondachat_price">+ 600,00€</div>
		                    	</div>
	                    	</div>
	                    </div>
                    </div>

                    <div class="mes_depots" style="display: none;">
                    	<div class="account_page"> 
	                    	<div class="pagetitle"> 
		                    	<h1 class="page_title">
		                        	{l s='Mes dépots' d='Shop.Theme.Customeraccount'}
		                        </h1>
		                    </div>
	                    </div>
	                    <div class="account_subpage" style="display: none;">
		                    <div class="pagetitle">
		                        <h1 class="page_title sub_page_title">
		                        	<span class="backtoprevpage"></span>
		                        	{l s='Ajouter mon RIB' d='Shop.Theme.Customeraccount'}
		                        </h1>
		                    </div>
		                    <div id="details_depot" class="details_depot"> 
		                    	
		                    </div>
                		</div>
	                    <div class="list_demesdepots">
		                    <div class="list_demesdepots">
		                    	<div class="depot_head_title">Dépôts <span>en cours</span></div>
			                    <div class="mesdepots_encours">
				                    <div class="mesdepots_elt">
				                    	<div class="depot_top displayflex">
				                    		<div class="depot_refand_date">#567890 - {l s='Le' d='Shop.Theme.Actions'} 10/08/2021</div>
				                    		<div class="view_depot show_subpage"><a href="#" title="#">{l s='Voir le dépôt >' d='Shop.Theme.Actions'}</a></div>
				                    	</div>
					                    <div class="depot_center displayflex">
			                    			<div class="depot_img">
			                    				<a href="#" title="#"><img src="{$urls.img_url}/compte4.jpg" alt=""></a>
			                    			</div>
			                    			<div class="depot_right displayflex">
			                    				<div class="depot_infos">
			                    					<div class="depot_title"><a href="" title="#">{l s='Balenciaga' d='Shop.Theme.Actions'}</a></div>
			                    					<div class="depot_desc"><a href="" title="#">{l s='BB Chain' d='Shop.Theme.Actions'}</a></div>
			                    					<div class="depot_quality">{l s='Très bon état' d='Shop.Theme.Actions'}</div>
			                    				</div>
			                    				<div class="depot_price_and_status displayflex">
			                    					<div class="depot_price">{l s='Prix souhaité :' d='Shop.Theme.Actions'} 600 €</div>
			                    					<div class="depot_status">{l s='Statut :' d='Shop.Theme.Actions'} <span style="color: #C77229">En cours de négociation</span></div>
			                    				</div>
			                    			</div>
				                    	</div>
				                    	<div class="depot_bottom displayflex">
				                    		<div class="depot_price displayflex">{l s='Proposition de prix :' d='Shop.Theme.Actions'} <span>560,00 €</span></div>
				                    		<div class="accept_link"><a class="boutonstyle displayflex" href="" title="{l s='Accepter' d='Shop.Theme.Actions'}">{l s='Accepter' d='Shop.Theme.Actions'}</a></div>
				                    	</div>
			                    	</div>
				                    <div class="mesdepots_elt">
				                    	<div class="depot_top displayflex">
				                    		<div class="depot_refand_date">#567890 - {l s='Le' d='Shop.Theme.Actions'} 10/08/2021</div>
				                    		<div class="view_depot"><a href="#" title="#">{l s='Voir le dépôt >' d='Shop.Theme.Actions'}</a></div>
				                    	</div>
					                    <div class="depot_center displayflex">
			                    			<div class="depot_img">
			                    				<a href="#" title="#"><img src="{$urls.img_url}/compte4.jpg" alt=""></a>
			                    			</div>
			                    			<div class="depot_right displayflex">
			                    				<div class="depot_infos">
			                    					<div class="depot_title"><a href="" title="#">Louis Vuitton</a></div>
			                    					<div class="depot_desc"><a href="" title="#"></a></div>
			                    					<div class="depot_quality">{l s='Très bon état' d='Shop.Theme.Actions'}</div>
			                    				</div>
			                    				<div class="depot_price_and_status displayflex">
			                    					<div class="depot_price">{l s='Prix net :' d='Shop.Theme.Actions'} 1000 €</div>
			                    					<div class="depot_status">{l s='Statut :' d='Shop.Theme.Actions'} <span style="color: #57A073">En ligne</span></div>
			                    				</div>
			                    			</div>
				                    	</div>
				                    	<!--<div class="depot_bottom displayflex">
				                    		<div class="depot_price displayflex">{l s='Proposition de prix :' d='Shop.Theme.Actions'} <span>560,00 €</span></div>
				                    		<div class="accept_link"><a class="boutonstyle displayflex" href="" title="{l s='Accepter' d='Shop.Theme.Actions'}">{l s='Accepter' d='Shop.Theme.Actions'}</a></div>
				                    	</div>-->
			                    	</div>
		                    	</div>
		                    </div>
		                    <div class="list_demesdepots">
		                    	<div class="depot_head_title">Dépôts <span>vendus</span></div>
			                    <div class="mesdepots_encours">
				                    <div class="mesdepots_elt">
				                    	<div class="depot_top displayflex">
				                    		<div class="depot_refand_date">#890031 - {l s='Le' d='Shop.Theme.Actions'} 20/05/2021</div>
				                    		<div class="view_depot"><a href="#" title="#">{l s='Voir le dépôt >' d='Shop.Theme.Actions'}</a></div>
				                    	</div>
					                    <div class="depot_center displayflex">
			                    			<div class="depot_img">
			                    				<a href="#" title="#"><img src="{$urls.img_url}/compte4.jpg" alt=""></a>
			                    			</div>
			                    			<div class="depot_right displayflex">
			                    				<div class="depot_infos">
			                    					<div class="depot_title"><a href="" title="#">DIOR</a></div>
			                    					<div class="depot_desc"><a href="" title="#">MINI SAC POCHETTE Très bon état</a></div>
			                    					<div class="depot_quality">{l s='Très bon état' d='Shop.Theme.Actions'}</div>
			                    				</div>
			                    				<div class="depot_price_and_status displayflex">
			                    					<div class="depot_price">{l s='Prix net vendeur :' d='Shop.Theme.Actions'} 380 €</div>
			                    					<div class="depot_status">{l s='Statut :' d='Shop.Theme.Actions'} <span style="color: #000">En ligne</span></div>
			                    				</div>
			                    			</div>
				                    	</div>
				                    	<!--<div class="depot_bottom displayflex">
				                    		<div class="depot_price displayflex">{l s='Proposition de prix :' d='Shop.Theme.Actions'} <span>560,00 €</span></div>
				                    		<div class="accept_link"><a class="boutonstyle displayflex" href="" title="{l s='Accepter' d='Shop.Theme.Actions'}">{l s='Accepter' d='Shop.Theme.Actions'}</a></div>
				                    	</div>-->
			                    	</div>
		                    	</div>
		                    </div>
	                    </div>
                    </div>
{/block}