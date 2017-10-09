require './lib/helpers/gkelite/gk_garments'
require './lib/helpers/gkelite/customizer_ui'

### Define Page Class
class CustomizerPage < BasePage
  include PageObject
  include GKEliteGarments
  include CustomizerUI

  ### Declare Class Modules ###
  # Define Page Elements Into Accessor Object(:your_name) Methods
  # Page Elements => accessor(:your_name, identifier: "index")

  div(:page_load, css: "#gk-custom-app-vue > div > div")
  
  ## Design & Color ##
  checkbox(:disclaimer_checkbox, id: "disclaimer")
  button(:start_over, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__manipulators > button:nth-child(1)")
  button(:undo, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__manipulators > button:nth-child(2)")
  button(:zoom_in, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__manipulators > button:nth-child(3)")
  button(:zoom_out, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__manipulators > button:nth-child(4)")
  button(:share_design_button, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__ctas > div > div.c-share__design > button")
  button(:save_design_button, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__ctas > div > div.c-save__design > div > button:nth-child(1)")
  button(:save_design_dropdown, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__ctas > div > div.c-save__design > div > button.c-save__as__dropdown__arrow")
  button(:save_as_design, css: "#gk-custom-app-vue > div > div > div.c-customizer__content > div.c-customizer__primary > div.c-customizer__controls > div.c-customizer__ctas > div > div.c-save__design > button")
  div(:error_tooltip, class: ["c-tooltip__error__container"])
  div(:disclaimer, class: ["c-disclaimer"])
  
  ## Navigation Buttons ##
  button(:embellishments_button, css: "#navlink-embellishments > button")
  button(:design_color_button, css: "#navlink-design > button:nth-child(1)")
  button(:additional_options_button, css: "#navlink-additional-options > button")
  button(:size_alterations_button, css: "#navlink-sizes-and-alterations > button")


  ## Header Breadcrumbs ##
  button(:breadcrumb_design, css: "#breadcrumb-design > button")
  button(:breadcrumb_embellishments, css: "#breadcrumb-embellishments > button")
  list_item(:disabled_breadcrumb_embellishments, id: "breadcrumb-embellishments")
  button(:breadcrumb_additional_options, css: "#breadcrumb-additional-options > button")
  list_item(:disabled_breadcrumb_additional_options, id: "breadcrumb-additional-options")
  button(:breadcrumb_sizes_alterations, css: "#breadcrumb-sizes-and-alterations > button")
  list_item(:disabled_breadcrumb_sizes_alterations, id: "breadcrumb-sizes-and-alterations")

  ## Sizes & Alterations Popup ##
  div(:size_alterations_popup, css: "#gk-custom-app-vue > div > div > div > div > div")
  checkbox(:popup_checkbox_one, css: "#gk-custom-app-vue > div > div > div > div > div > div > ul > li:nth-child(1) > input[type='checkbox']")
  checkbox(:popup_checkbox_two, css: "#gk-custom-app-vue > div > div > div > div > div > div > ul > li:nth-child(2) > input[type='checkbox']")
  button(:popup_cancel_button, css: "#gk-custom-app-vue > div > div > div > div > div > div > div > span:nth-child(1) > button")
  button(:popup_next_button, css: "#gk-custom-app-vue > div > div > div > div > div > div > div > span:nth-child(2) > button")
  span(:disabled_next_button, css: "#gk-custom-app-vue > div > div > div > div > div > div > div > span.disabled")
  span(:saving_design, css: "#gk-custom-app-vue > div > div > div > div > div > h2 > span")
  div(:saving_popup, class: ["mask c-save"])
  div(:selected_style, class: ["c-customizer__menu-selectedstyles"])
  

$sequinz_colors = ['WHITE',
                   'SILVER',
                   'SILVER HOLOGRAM',
                   'BLACK',
                   'RED',
                   'RED HOLOGRAM',
                   'GOLD',
                   'GOLD HOLOGRAM',
                   'LEMON-LIME',
                   'LEMON-LIME HOLOGRAM',
                   'KELLY GREEN',
                   'KELLY GREEN HOLOGRAM',
                   'TURQUOISE',
                   'TURQUOISE HOLOGRAM',
                   'ROYAL',
                   'ROYAL HOLOGRAM',
                   'PURPLE',
                   'BERRY',
                   'BERRY HOLOGRAM',
                   'PINK',
                   'PINK HOLOGRAM',
                   'ORANGE',
                   'ORANGE HOLOGRAM']



$spanglez_colors = ['SILVER GLOSSY',
                    'GOLD GLOSSY',
                    'BERRY GLOSSY',
                    'BLACK GLOSSY',
                    'KELLY GREEN GLOSSY',
                    'ORANGE GLOSSY',
                    'PURPLE GLOSSY',
                    'RED FLAT',
                    'ROYAL FLAT',
                    'TURQ GLOSSY',
                    'SEAGLASS GLOSSY',
                    'LEMON LIME FLAT',
                    'SILVER HOLO',
                    'GOLD HOLO',
                    'BERRY HOLO',
                    'RED HOLO',
                    'ROYAL HOLO',
                    'KELLY GREEN HOLO',
                    'LEMON LIME HOLO',
                    'PINK GLOSSY']


$sublimation_colors = ['VEGAS GOLD',
                        'GOLD',
                        'YELLOW',
                        'NEON YELLOW',
                        'TANGERINE',
                        'ORANGE',
                        'CORAL',
                        'COSMO',
                        'CANDY APPLE',
                        'RED',
                        'CRIMSON',
                        'NEON PINK',
                        'PINK',
                        'BERRY',
                        'HOT PINK',
                        'CHERRY',
                        'FUCHSIA',
                        'SANGRIA',
                        'WILDBERRY',
                        'WISTERIA',
                        'ULTRA VIOLET',
                        'PURPLE',
                        'SAPPHIRE',
                        'NAVY',
                        'MIDNIGHT',
                        'COLUMBIA BLUE',
                        'BRIGHT TURQUOISE',
                        'ROYAL',
                        'ELECTRIC BLUE',
                        'TURQUOISE',
                        'SPRUCE',
                        'EVERGREEN',
                        'KELLY',
                        'KEY LIME',
                        'GRAY',
                        'FLANNEL GRAY',
                        'CARBON',
                        'BLACK',
                        'BROWN',
                        'ALUMINUM',
                        'PEWTER',
                        'WHITE',
                        'TEAL',
                        'BLUE RIBBON',
                        'CARDINAL']


$mesh_colors = ['NUDE',
                'CONCORD',
                'OCEAN',
                'HOT RED',
                'MERLOT',
                'BROWN',
                'MAGENTA',
                'WHITE',
                'BERRY',
                'BLACK',
                'CALYPSO',
                'NAVY']


$embroidery_colors = ['WHITE',
                      'SILVER',
                      'BLACK',
                      'RED',
                      'ORANGE',
                      'GOLD',
                      'GOLD GLIMMER',
                      'YELLOW',
                      'NEON YELLOW',
                      'FOREST GREEN',
                      'LIME GREEN',
                      'EMERALD GREEN',
                      'TEAL',
                      'LIGHT BLUE',
                      'TURQUOISE',
                      'ROYAL',
                      'NAVY',
                      'PURPLE',
                      'VIOLET',
                      'MAROON',
                      'ORCHID',
                      'RUBY GLINT',
                      'PINK',
                      'WILD PINK',
                      'FLAMINGO',
                      'CHEEKY PINK']


$imprinting_colors = ['WHITE',
                          'BLACK',
                          'RED',
                          'ORANGE',
                          'GOLD',
                          'VEGAS GOLD',
                          'BRIGHT GOLD',
                          'FOREST GREEN',
                          'HUNTER GREEN',
                          'ROYAL',
                          'NAVY',
                          'ALUMINUM',
                          'PURPLE',
                          'BURGUNDY',
                          'NEON CHERRY',
                          'NEON CORAL',
                          'NEON ORANGE',
                          'NEON YELLOW',
                          'NEON GREEN',
                          'NEON BLUE',
                          'NEON PINK',
                          'SILVER PRISM',
                          'METALLIC RED',
                          'GOLD PRISM',
                          'METALLIC BLUE',
                          'METALLIC WYSTERIA',
                          'METALLIC MAGENTA',
                          'GLITTER WHITE',
                          'GLITTER ORANGE',
                          'GLITTER YELLOW',
                          'GLITTER GREEN',
                          'GLITTER BLUE',
                          'GLITTER PURPLE',
                          'GLITTER PINK',
                          'NEON RASPBERRY']


$orientation_full = ['VERTICAL UP', 
                          'VERTICAL DOWN',
                          'VERTICAL STACKED']

$orientation_upper = ['HORIZONTAL', 
                           'VERTICAL UP', 
                           'VERTICAL DOWN']


$font_options = ['NULSHOCK',
                 'AACHAN BOLD',
                 'LUBIN GRAPH BOOK BOLD',
                 'BOOKMAN OLD STYLE BOLD',
                 'BOOKMAN ITALIC',
                 'SWING BOLD',
                 'BRUSH SCRIPT',
                 'BRODY',
                 'IMPACT',
                 'ADELON SERIAL',
                 'FRESHMAN',
                 'HELVETICA BOLD',
                 'POPLAR']


$embellishment_types = ['EMBROIDERY',
                       'IMPRINTING',
                       'CRYSTALS',
                       'SEQUINZ',
                       'SPANGLEZ',
                       'IMPRINTZ']


$crystal_colors = ['CLEAR',
                         'BRILLIANCE',
                         'METALLIC SILVER',
                         'BLACK DIAMOND',
                         'BLACK',
                         'METALLIC GOLD',
                         'RUBY',
                         'TANGERINE',
                         'GOLD BRILLIANCE',
                         'CITRINE',
                         'MANGO',
                         'KIWI',
                         'JADE',
                         'AQUAMARINE',
                         'ELECTRIC BLUE',
                         'COBALT',
                         'MIDNIGHT',
                         'LAVENDER',
                         'VIOLET',
                         'AMETHYST',
                         'ULTRAVIOLET BRILLIANCE',
                         'FUCHSIA',
                         'SANGRIA',
                         'PINK',
                         'PEACOCK BRILLIANCE',
                         'DARK BRILLIANCE']


$hologram_colors = ['GRAPE OPALESCENCE',
                    'BLACK SPARKLE',
                    'WHITE SPARKLE',
                    'KELLY SPARKLE',
                    'RADIANT ROYAL SPARKLE',
                    'FIESTA OPALESCENCE',
                    'JET OPALESCENCE',
                    'FIESTA SPARKLE',
                    'MAGENTA SPARKLE',
                    'GOLD OPALESCENCE',
                    'BERRY OPALESCENCE',
                    'NEON GREEN OPALESCENCE',
                    'SEAGLASS OPALESCENCE',
                    'NEON YELLOW OPALESCENCE',
                    'WHITE OPALESCENCE',
                    'LEMON LIME SPARKLE',
                    'TURQUOISE OPALESCENCE',
                    'MAGENTA OPALESCENCE',
                    'IMPERIAL PURPLE SPARKLE',
                    'PACIFIC OPALESCENCE',
                    'SEAGLASS SPARKLE',
                    'TURQUOISE SPARKLE',
                    'WILD SANGRIA SPARKLE',
                    'AZURE SPARKLE',
                    'IMPERIAL PURPLE OPALESCENCE']

$nylon_spandex_colors = ['BERRY',
                          'BURGUNDY',
                          'EVERGREEN',
                          'GOLD',
                          'KELLY GREEN',
                          'NAVY',
                          'ORANGE',
                          'PEWTER',
                          'PURPLE',
                          'RED',
                          'ROYAL',
                          'SAPPHIRE',
                          'TURQUOISE',
                          'WHITE',
                          'SANGRIA',
                          'ELECTRIC BLUE',
                          'MAGENTA',
                          'CALYPSO',
                          'LIPSTICK',
                          'WYSTERIA',
                          'BLACK',
                          'STEEL']

$velvet_colors = ['BLACK',
                  'SAPPHIRE',
                  'EGGPLANT']


$foil_colors = ['GOLD MYSTIQUE',
                'COLUMBIA BLUE MYSTIQUE',
                'OCEAN MYSTIQUE',
                'WILD ORCHID MYSTIQUE',
                'RED MYSTIQUE',
                'SUNSHINE MYSTIQUE',
                'GRAPE MYSTIQUE',
                'CHERRY MYSTIQUE',
                'NAVY MYSTIQUE',
                'BLUE RASPBERRY MYSTIQUE',
                'SILVER MYSTIQUE',
                'BERRY MYSTIQUE',
                'BLACK MYSTIQUE',
                'RAINFOREST MYSTIQUE',
                'WHITE MYSTIQUE',
                'ELECTRIC TURQUOISE MYSTIQUE',
                'LEMON LIME MYSTIQUE',
                'EVERGREEN MYSTIQUE',
                'VINCA MYSTIQUE',
                'LAVENDER ICE MYSTIQUE',
                'RICH ROYAL MYSTIQUE',
                'MINT JULEP MYSTIQUE',
                'PLUM MYSTIQUE',
                'LIME MYSTIQUE',
                'GUNMETAL MYSTIQUE',
                'STEEL MYSTIQUE',
                'AZURE MYSTIQUE',
                'YELLOW MYSTIQUE',
                'CHARCOAL MYSTIQUE',
                'MERLOT MYSTIQUE',
                'KELLY GREEN MYSTIQUE',
                'SANGRIA MYSTIQUE',
                'IMPERIAL PURPLE MYSTIQUE',
                'NEON YELLOW MYSTIQUE',
                'PASSION MYSTIQUE',
                'STERLING SILVER MYSTIQUE',
                'NEON CORAL MYSTIQUE',
                'PEACOCK IRIDESCENT',
                'CHAMPAGNE MYSTIQUE',
                'FLUORESCENT LIME MYSTIQUE',
                'FLUORESCENT PINK MYSTIQUE',
                'FLUORESCENT ORANGE MYSTIQUE',
                'FLUORESCENT YELLOW MYSTIQUE',
                'GOLD LEAF']


$shadowproof_colors = ['NUDE',
                      'BROWN']


$two_color_combo = ['PINK',
                    'PURPLE',
                    'BLACK AND WHITE',
                    'BLUES',
                    'REDS',
                    'GREENS']


$two_color_pink = ['SANGRIA TO WHITE',
                    'SANGRIA TO BLACK',
                    'SANGRIA TO BERRY',
                    'FUCHSIA TO WHITE',
                    'FUCHSIA TO BLACK',
                    'BERRY TO WHITE',
                    'BERRY TO BLACK',
                    'CORAL TO BLACK',
                    'NEON PINK TO BLACK',
                    'CHERRY TO CORAL',
                    'CORAL TO WHITE']


$two_color_purple = ['PURPLE TO WHITE',
                      'PURPLE TO BLACK',
                      'PURPLE TO ULTRA VIOLET',
                      'PURPLE TO WISTERIA',
                      'ULTRA VIOLET TO WHITE']


$two_color_blue = ['NAVY TO WHITE',
                    'NAVY TO BLACK',
                    'NAVY TO COLUMBIA BLUE',
                    'SAPPHIRE TO WHITE',
                    'ROYAL TO WHITE',
                    'ROYAL TO BLACK',
                    'ELECTRIC BLUE TO WHITE',
                    'ELECTRIC BLUE TO BLACK',
                    'ELECTRIC BLUE TO ROYAL',
                    'COLUMBIA BLUE TO WHITE',
                    'TURQUOISE TO WHITE',
                    'TURQUOISE TO BLACK',
                    'ELECTRIC BLUE TO NAVY']


$two_color_red = ['CRIMSON TO WHITE',
                  'CRIMSON TO BLACK',
                  'RED TO WHITE',
                  'RED TO BLACK',
                  'CANDY APPLE TO WHITE',
                  'CANDY APPLE TO BLACK',
                  'COSMO TO WHITE',
                  'COSMO TO BLACK',
                  'CHERRY TO BLACK']


$two_color_green = ['SPRUCE TO WHITE',
                    'KELLY TO WHITE']


$reverse_two_color_pink = ['WHITE TO SANGRIA',
                            'BLACK TO SANGRIA',
                            'BERRY TO SANGRIA',
                            'WHITE TO FUCHSIA',
                            'BLACK TO FUCHSIA',
                            'WHITE TO BERRY',
                            'BLACK TO BERRY',
                            'BLACK TO CORAL',
                            'BLACK TO NEON PINK',
                            'CORAL TO CHERRY',
                            'WHITE TO CORAL']


$reverse_two_color_purple = ['WHITE TO PURPLE',
                              'BLACK TO PURPLE',
                              'ULTRA VIOLET TO PURPLE',
                              'WISTERIA TO PURPLE',
                              'WHITE TO ULTRA VIOLET']


$reverse_two_color_blue = ['WHITE TO NAVY',
                            'BLACK TO NAVY',
                            'COLUMBIA BLUE TO NAVY',
                            'WHITE TO SAPPHIRE',
                            'WHITE TO ROYAL',
                            'BLACK TO ROYAL',
                            'WHITE TO ELECTRIC BLUE',
                            'BLACK TO ELECTRIC BLUE',
                            'ROYAL TO ELECTRIC BLUE',
                            'WHITE TO COLUMBIA BLUE',
                            'WHITE TO TURQUOISE',
                            'BLACK TO TURQUOISE',
                            'NAVY TO ELECTRIC BLUE']


$reverse_two_color_red = ['WHITE TO CRIMSON',
                          'BLACK TO CRIMSON',
                          'WHITE TO RED',
                          'BLACK TO RED',
                          'WHITE TO CANDY APPLE',
                          'BLACK TO CANDY APPLE',
                          'WHITE TO COSMO',
                          'BLACK TO COSMO',
                          'BLACK TO CHERRY']


$reverse_two_color_green = ['WHITE TO SPRUCE',
                            'WHITE TO KELLY']


$three_color_combo = ['PINK',
                      'PURPLE',
                      'PATRIOTIC',
                      'BLUE']


$three_color_pink = ['WHITE TO SANGRIA TO BLACK',
                      'WHITE TO CHERRY TO BLACK',
                      'WHITE TO BERRY TO BLACK']


$three_color_purple = ['WHITE TO PURPLE TO BLACK',
                        'WHITE TO ULTRA VIOLET TO PURPLE',
                        'WHITE TO WISTERIA TO PURPLE']


$three_color_patriotic = ['RED TO WHITE TO NAVY',
                          'RED TO WHITE TO ROYAL',
                          'CANDY APPLE TO WHITE TO NAVY']


$three_color_blue = ['NAVY TO COLUMBIA BLUE TO WHITE',
                      'NAVY TO ROYAL TO WHITE',
                      'WHITE TO ROYAL TO BLACK',
                      'WHITE TO TURQUOISE TO BLACK',
                      'NAVY TO WHITE TO CANDY APPLE',
                      'ROYAL TO WHITE TO CANDY APPLE']


$reverse_three_color_pink = ['BLACK TO SANGRIA TO WHITE',
                              'BLACK TO CHERRY TO WHITE',
                              'BLACK TO BERRY TO WHITE']


$reverse_three_color_purple = ['BLACK TO PURPLE TO WHITE',
                                'PURPLE TO ULTRA VIOLET TO WHITE',
                                'PURPLE TO WISTERIA TO WHITE']


$reverse_three_color_patriotic = ['NAVY TO WHITE TO RED',
                                  'ROYAL TO WHITE TO RED',
                                  'NAVY TO WHITE TO CANDY APPLE']


$reverse_three_color_blue = ['CANDY APPLE TO WHITE TO ROYAL',
                              'CANDY APPLE TO WHITE TO NAVY',
                              'WHITE TO COLUMBIA BLUE TO NAVY',
                              'WHITE TO ROYAL TO NAVY',
                              'BLACK TO ROYAL TO WHITE',
                              'BLACK TO TURQUOISE TO WHITE']



$stretch_tech_colors = ['RED','ROYAL','NAVY','WHITE','BLACK']

  ### Define Methods/Functions Below:
end