;;; company-emoji.el --- company-mode backend for emoji

;; Copyright (C) 2015 Alex Dunn

;; Author: Alex Dunn <dunn.alex@gmail.com>
;; URL: https://github.com/dunn/company-emoji.git
;; Version: 1.0.0
;; Package-Requires: ((cl-lib "0.5") (company "0.8.0"))
;; Keywords: emoji company honk
;; Prefix: company-emoji

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Like emoji-cheat-sheet-(plus), but as a company-mode backend, and
;; using unicode instead of PNGs.

;; Add it to your load-path, then:
;;
;; (require 'company-emoji)
;; (add-hook 'markdown-mode-hook 'company-emoji-init)
;; (add-hook 'mail-mode-hook 'company-emoji-init)
;;
;; or however you want.

;;; Code:

;; requires

(require 'cl-lib)
(require 'company)

;; the other stuff

(defconst company-emoji-version "1.0.0")

(defun company-emoji-list ()
  "Return the propertized list of emoji."
;; See
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Text-Props-and-Strings.html
;; for the syntax.
  (list
    #(":grinning:" 0 1 (:unicode "😀"))
    #(":grin:" 0 1 (:unicode "😁"))
    #(":joy:" 0 1 (:unicode "😂"))
    #(":smiley:" 0 1 (:unicode "😃"))
    #(":smile:" 0 1 (:unicode "😄"))
    #(":sweat_smile:" 0 1 (:unicode "😅"))
    #(":satisfied:" 0 1 (:unicode "😆"))
    #(":innocent:" 0 1 (:unicode "😇"))
    #(":smiling_imp:" 0 1 (:unicode "😈"))
    #(":imp:" 0 1 (:unicode "👿"))
    #(":wink:" 0 1 (:unicode "😉"))
    #(":blush:" 0 1 (:unicode "😊"))
    #(":yum:" 0 1 (:unicode "😋"))
    #(":relieved:" 0 1 (:unicode "😌"))
    #(":heart_eyes:" 0 1 (:unicode "😍"))
    #(":sunglasses:" 0 1 (:unicode "😎"))
    #(":smirk:" 0 1 (:unicode "😏"))
    #(":neutral_face:" 0 1 (:unicode "😐"))
    #(":expressionless:" 0 1 (:unicode "😑"))
    #(":unamused:" 0 1 (:unicode "😒"))
    #(":sweat:" 0 1 (:unicode "😓"))
    #(":pensive:" 0 1 (:unicode "😔"))
    #(":confused:" 0 1 (:unicode "😕"))
    #(":confounded:" 0 1 (:unicode "😖"))
    #(":kissing:" 0 1 (:unicode "😗"))
    #(":kissing_heart:" 0 1 (:unicode "😘"))
    #(":kissing_smiling_eyes:" 0 1 (:unicode "😙"))
    #(":kissing_closed_eyes:" 0 1 (:unicode "😚"))
    #(":stuck_out_tongue:" 0 1 (:unicode "😛"))
    #(":stuck_out_tongue_winking_eye:" 0 1 (:unicode "😜"))
    #(":stuck_out_tongue_closed_eyes:" 0 1 (:unicode "😝"))
    #(":disappointed:" 0 1 (:unicode "😞"))
    #(":worried:" 0 1 (:unicode "😟"))
    #(":angry:" 0 1 (:unicode "😠"))
    #(":rage:" 0 1 (:unicode "😡"))
    #(":cry:" 0 1 (:unicode "😢"))
    #(":persevere:" 0 1 (:unicode "😣"))
    #(":triumph:" 0 1 (:unicode "😤"))
    #(":disappointed_relieved:" 0 1 (:unicode "😥"))
    #(":frowning:" 0 1 (:unicode "😦"))
    #(":anguished:" 0 1 (:unicode "😧"))
    #(":fearful:" 0 1 (:unicode "😨"))
    #(":weary:" 0 1 (:unicode "😩"))
    #(":sleepy:" 0 1 (:unicode "😪"))
    #(":tired_face:" 0 1 (:unicode "😫"))
    #(":grimacing:" 0 1 (:unicode "😬"))
    #(":sob:" 0 1 (:unicode "😭"))
    #(":open_mouth:" 0 1 (:unicode "😮"))
    #(":hushed:" 0 1 (:unicode "😯"))
    #(":cold_sweat:" 0 1 (:unicode "😰"))
    #(":scream:" 0 1 (:unicode "😱"))
    #(":astonished:" 0 1 (:unicode "😲"))
    #(":flushed:" 0 1 (:unicode "😳"))
    #(":sleeping:" 0 1 (:unicode "😴"))
    #(":dizzy_face:" 0 1 (:unicode "😵"))
    #(":no_mouth:" 0 1 (:unicode "😶"))
    #(":mask:" 0 1 (:unicode "😷"))
    #(":smile_cat:" 0 1 (:unicode "😸"))
    #(":joy_cat:" 0 1 (:unicode "😹"))
    #(":smiley_cat:" 0 1 (:unicode "😺"))
    #(":heart_eyes_cat:" 0 1 (:unicode "😻"))
    #(":smirk_cat:" 0 1 (:unicode "😼"))
    #(":kissing_cat:" 0 1 (:unicode "😽"))
    #(":pouting_cat:" 0 1 (:unicode "😾"))
    #(":crying_cat_face:" 0 1 (:unicode "😿"))
    #(":scream_cat:" 0 1 (:unicode "🙀"))
    #(":footprints:" 0 1 (:unicode "👣"))
    #(":bust_in_silhouette:" 0 1 (:unicode "👤"))
    #(":busts_in_silhouette:" 0 1 (:unicode "👥"))
    #(":baby:" 0 1 (:unicode "👶"))
    #(":boy:" 0 1 (:unicode "👦"))
    #(":girl:" 0 1 (:unicode "👧"))
    #(":man:" 0 1 (:unicode "👨"))
    #(":woman:" 0 1 (:unicode "👩"))
    #(":man-woman-boy:" 0 1 (:unicode "👪"))
    #(":man-woman-girl:" 0 1 (:unicode "👨‍👩‍👧"))
    #(":man-woman-girl-boy:" 0 1 (:unicode "👨‍👩‍👧‍👦"))
    #(":man-woman-boy-boy:" 0 1 (:unicode "👨‍👩‍👦‍👦"))
    #(":man-woman-girl-girl:" 0 1 (:unicode "👨‍👩‍👧‍👧"))
    #(":woman-woman-boy:" 0 1 (:unicode "👩‍👩‍👦"))
    #(":woman-woman-girl:" 0 1 (:unicode "👩‍👩‍👧"))
    #(":woman-woman-girl-boy:" 0 1 (:unicode "👩‍👩‍👧‍👦"))
    #(":woman-woman-boy-boy:" 0 1 (:unicode "👩‍👩‍👦‍👦"))
    #(":woman-woman-girl-girl:" 0 1 (:unicode "👩‍👩‍👧‍👧"))
    #(":man-man-boy:" 0 1 (:unicode "👨‍👨‍👦"))
    #(":man-man-girl:" 0 1 (:unicode "👨‍👨‍👧"))
    #(":man-man-girl-boy:" 0 1 (:unicode "👨‍👨‍👧‍👦"))
    #(":man-man-boy-boy:" 0 1 (:unicode "👨‍👨‍👦‍👦"))
    #(":man-man-girl-girl:" 0 1 (:unicode "👨‍👨‍👧‍👧"))
    #(":woman_man_holding_hands:" 0 1 (:unicode "👫"))
    #(":two_men_holding_hands:" 0 1 (:unicode "👬"))
    #(":two_women_holding_hands:" 0 1 (:unicode "👭"))
    #(":dancers:" 0 1 (:unicode "👯"))
    #(":bride_with_veil:" 0 1 (:unicode "👰"))
    #(":person_with_blond_hair:" 0 1 (:unicode "👱"))
    #(":man_with_gua_pi_mao:" 0 1 (:unicode "👲"))
    #(":man_with_turban:" 0 1 (:unicode "👳"))
    #(":older_man:" 0 1 (:unicode "👴"))
    #(":older_woman:" 0 1 (:unicode "👵"))
    #(":cop:" 0 1 (:unicode "👮"))
    #(":construction_worker:" 0 1 (:unicode "👷"))
    #(":princess:" 0 1 (:unicode "👸"))
    #(":guardsman:" 0 1 (:unicode "💂"))
    #(":angel:" 0 1 (:unicode "👼"))
    #(":santa:" 0 1 (:unicode "🎅"))
    #(":ghost:" 0 1 (:unicode "👻"))
    #(":japanese_ogre:" 0 1 (:unicode "👹"))
    #(":japanese_goblin:" 0 1 (:unicode "👺"))
    #(":poop:" 0 1 (:unicode "💩"))
    #(":skull:" 0 1 (:unicode "💀"))
    #(":alien:" 0 1 (:unicode "👽"))
    #(":space_invader:" 0 1 (:unicode "👾"))
    #(":bow:" 0 1 (:unicode "🙇"))
    #(":information_desk_person:" 0 1 (:unicode "💁"))
    #(":no_good:" 0 1 (:unicode "🙅"))
    #(":ok_woman:" 0 1 (:unicode "🙆"))
    #(":raising_hand:" 0 1 (:unicode "🙋"))
    #(":person_with_pouting_face:" 0 1 (:unicode "🙎"))
    #(":person_frowning:" 0 1 (:unicode "🙍"))
    #(":massage:" 0 1 (:unicode "💆"))
    #(":haircut:" 0 1 (:unicode "💇"))
    #(":woman-heart-man:" 0 1 (:unicode "💑"))
    #(":woman-heart-woman:" 0 1 (:unicode "👩‍❤️‍👩"))
    #(":man-heart-man:" 0 1 (:unicode "👨‍❤️‍👨"))
    #(":woman-kiss-man:" 0 1 (:unicode "💏"))
    #(":woman-kiss-woman:" 0 1 (:unicode "👩‍❤️‍💋‍👩"))
    #(":man-kiss-man:" 0 1 (:unicode "👨‍❤️‍💋‍👨"))
    #(":raised_hands:" 0 1 (:unicode "🙌"))
    #(":clap:" 0 1 (:unicode "👏"))
    #(":ear:" 0 1 (:unicode "👂"))
    #(":eyes:" 0 1 (:unicode "👀"))
    #(":nose:" 0 1 (:unicode "👃"))
    #(":lips:" 0 1 (:unicode "👄"))
    #(":kiss:" 0 1 (:unicode "💋"))
    #(":tongue:" 0 1 (:unicode "👅"))
    #(":nail_care:" 0 1 (:unicode "💅"))
    #(":wave:" 0 1 (:unicode "👋"))
    #(":thumbsup:" 0 1 (:unicode "👍"))
    #(":thumbsdown:" 0 1 (:unicode "👎"))
    #(":point_up:" 0 1 (:unicode "☝️"))
    #(":point_up_2:" 0 1 (:unicode "👆"))
    #(":point_down:" 0 1 (:unicode "👇"))
    #(":point_left:" 0 1 (:unicode "👈"))
    #(":point_right:" 0 1 (:unicode "👉"))
    #(":ok_hand:" 0 1 (:unicode "👌"))
    #(":v:" 0 1 (:unicode "✌️"))
    #(":punch:" 0 1 (:unicode "👊"))
    #(":fist:" 0 1 (:unicode "✊"))
    #(":raised_hand:" 0 1 (:unicode "✋"))
    #(":muscle:" 0 1 (:unicode "💪"))
    #(":open_hands:" 0 1 (:unicode "👐"))
    #(":pray:" 0 1 (:unicode "🙏"))
    #(":spock:" 0 1 (:unicode "🖖"))
    #(":seedling:" 0 1 (:unicode "🌱"))
    #(":evergreen_tree:" 0 1 (:unicode "🌲"))
    #(":deciduous_tree:" 0 1 (:unicode "🌳"))
    #(":palm_tree:" 0 1 (:unicode "🌴"))
    #(":cactus:" 0 1 (:unicode "🌵"))
    #(":tulip:" 0 1 (:unicode "🌷"))
    #(":cherry_blossom:" 0 1 (:unicode "🌸"))
    #(":rose:" 0 1 (:unicode "🌹"))
    #(":hibiscus:" 0 1 (:unicode "🌺"))
    #(":sunflower:" 0 1 (:unicode "🌻"))
    #(":blossom:" 0 1 (:unicode "🌼"))
    #(":bouquet:" 0 1 (:unicode "💐"))
    #(":ear_of_rice:" 0 1 (:unicode "🌾"))
    #(":herb:" 0 1 (:unicode "🌿"))
    #(":four_leaf_clover:" 0 1 (:unicode "🍀"))
    #(":maple_leaf:" 0 1 (:unicode "🍁"))
    #(":fallen_leaf:" 0 1 (:unicode "🍂"))
    #(":leaves:" 0 1 (:unicode "🍃"))
    #(":mushroom:" 0 1 (:unicode "🍄"))
    #(":chestnut:" 0 1 (:unicode "🌰"))
    #(":rat:" 0 1 (:unicode "🐀"))
    #(":mouse2:" 0 1 (:unicode "🐁"))
    #(":mouse:" 0 1 (:unicode "🐭"))
    #(":hamster:" 0 1 (:unicode "🐹"))
    #(":ox:" 0 1 (:unicode "🐂"))
    #(":water_buffalo:" 0 1 (:unicode "🐃"))
    #(":cow2:" 0 1 (:unicode "🐄"))
    #(":cow:" 0 1 (:unicode "🐮"))
    #(":tiger2:" 0 1 (:unicode "🐅"))
    #(":leopard:" 0 1 (:unicode "🐆"))
    #(":tiger:" 0 1 (:unicode "🐯"))
    #(":rabbit2:" 0 1 (:unicode "🐇"))
    #(":rabbit:" 0 1 (:unicode "🐰"))
    #(":cat2:" 0 1 (:unicode "🐈"))
    #(":cat:" 0 1 (:unicode "🐱"))
    #(":racehorse:" 0 1 (:unicode "🐎"))
    #(":horse:" 0 1 (:unicode "🐴"))
    #(":ram:" 0 1 (:unicode "🐏"))
    #(":sheep:" 0 1 (:unicode "🐑"))
    #(":goat:" 0 1 (:unicode "🐐"))
    #(":rooster:" 0 1 (:unicode "🐓"))
    #(":chicken:" 0 1 (:unicode "🐔"))
    #(":baby_chick:" 0 1 (:unicode "🐤"))
    #(":hatching_chick:" 0 1 (:unicode "🐣"))
    #(":hatched_chick:" 0 1 (:unicode "🐥"))
    #(":bird:" 0 1 (:unicode "🐦"))
    #(":penguin:" 0 1 (:unicode "🐧"))
    #(":elephant:" 0 1 (:unicode "🐘"))
    #(":dromedary_camel:" 0 1 (:unicode "🐪"))
    #(":camel:" 0 1 (:unicode "🐫"))
    #(":boar:" 0 1 (:unicode "🐗"))
    #(":pig2:" 0 1 (:unicode "🐖"))
    #(":pig:" 0 1 (:unicode "🐷"))
    #(":pig_nose:" 0 1 (:unicode "🐽"))
    #(":dog2:" 0 1 (:unicode "🐕"))
    #(":poodle:" 0 1 (:unicode "🐩"))
    #(":dog:" 0 1 (:unicode "🐶"))
    #(":wolf:" 0 1 (:unicode "🐺"))
    #(":bear:" 0 1 (:unicode "🐻"))
    #(":koala:" 0 1 (:unicode "🐨"))
    #(":panda_face:" 0 1 (:unicode "🐼"))
    #(":monkey_face:" 0 1 (:unicode "🐵"))
    #(":see_no_evil:" 0 1 (:unicode "🙈"))
    #(":hear_no_evil:" 0 1 (:unicode "🙉"))
    #(":speak_no_evil:" 0 1 (:unicode "🙊"))
    #(":monkey:" 0 1 (:unicode "🐒"))
    #(":dragon:" 0 1 (:unicode "🐉"))
    #(":dragon_face:" 0 1 (:unicode "🐲"))
    #(":crocodile:" 0 1 (:unicode "🐊"))
    #(":snake:" 0 1 (:unicode "🐍"))
    #(":turtle:" 0 1 (:unicode "🐢"))
    #(":frog:" 0 1 (:unicode "🐸"))
    #(":whale2:" 0 1 (:unicode "🐋"))
    #(":whale:" 0 1 (:unicode "🐳"))
    #(":flipper:" 0 1 (:unicode "🐬"))
    #(":octopus:" 0 1 (:unicode "🐙"))
    #(":fish:" 0 1 (:unicode "🐟"))
    #(":tropical_fish:" 0 1 (:unicode "🐠"))
    #(":blowfish:" 0 1 (:unicode "🐡"))
    #(":shell:" 0 1 (:unicode "🐚"))
    #(":snail:" 0 1 (:unicode "🐌"))
    #(":bug:" 0 1 (:unicode "🐛"))
    #(":ant:" 0 1 (:unicode "🐜"))
    #(":honeybee:" 0 1 (:unicode "🐝"))
    #(":beetle:" 0 1 (:unicode "🐞"))
    #(":paw_prints:" 0 1 (:unicode "🐾"))
    #(":zap:" 0 1 (:unicode "⚡"))
    #(":fire:" 0 1 (:unicode "🔥"))
    #(":crescent_moon:" 0 1 (:unicode "🌙"))
    #(":sunny:" 0 1 (:unicode "☀️"))
    #(":partly_sunny:" 0 1 (:unicode "⛅"))
    #("️:cloud:" 0 1 (:unicode "️☁️"))
    #(":droplet:" 0 1 (:unicode "💧"))
    #(":sweat_drops:" 0 1 (:unicode "💦"))
    #(":umbrella:" 0 1 (:unicode "☔"))
    #(":dash:" 0 1 (:unicode "💨"))
    #(":snowflake:" 0 1 (:unicode "❄️"))
    #(":star2:" 0 1 (:unicode "🌟"))
    #(":star:" 0 1 (:unicode "⭐"))
    #(":shooting_star:" 0 1 (:unicode "🌠"))
    #(":sunrise_over_mountains:" 0 1 (:unicode "🌄"))
    #(":sunrise:" 0 1 (:unicode "🌅"))
    #(":rainbow:" 0 1 (:unicode "🌈"))
    #(":ocean:" 0 1 (:unicode "🌊"))
    #(":volcano:" 0 1 (:unicode "🌋"))
    #(":milky_way:" 0 1 (:unicode "🌌"))
    #(":mount_fuji:" 0 1 (:unicode "🗻"))
    #(":japan:" 0 1 (:unicode "🗾"))
    #(":globe_with_meridians:" 0 1 (:unicode "🌐"))
    #(":earth_africa:" 0 1 (:unicode "🌍"))
    #(":earth_americas:" 0 1 (:unicode "🌎"))
    #(":earth_asia:" 0 1 (:unicode "🌏"))
    #(":new_moon:" 0 1 (:unicode "🌑"))
    #(":waxing_crescent_moon:" 0 1 (:unicode "🌒"))
    #(":first_quarter_moon:" 0 1 (:unicode "🌓"))
    #(":waxing_gibbous_moon:" 0 1 (:unicode "🌔"))
    #(":full_moon:" 0 1 (:unicode "🌕"))
    #(":waning_gibbous_moon:" 0 1 (:unicode "🌖"))
    #(":last_quarter_moon:" 0 1 (:unicode "🌗"))
    #(":waning_crescent_moon:" 0 1 (:unicode "🌘"))
    #(":new_moon_with_face:" 0 1 (:unicode "🌚"))
    #(":full_moon_with_face:" 0 1 (:unicode "🌝"))
    #(":first_quarter_moon_with_face:" 0 1 (:unicode "🌛"))
    #(":last_quarter_moon_with_face:" 0 1 (:unicode "🌜"))
    #(":sun_with_face:" 0 1 (:unicode "🌞"))
    #(":tomato:" 0 1 (:unicode "🍅"))
    #(":eggplant:" 0 1 (:unicode "🍆"))
    #(":corn:" 0 1 (:unicode "🌽"))
    #(":sweet_potato:" 0 1 (:unicode "🍠"))
    #(":grapes:" 0 1 (:unicode "🍇"))
    #(":melon:" 0 1 (:unicode "🍈"))
    #(":watermelon:" 0 1 (:unicode "🍉"))
    #(":tangerine:" 0 1 (:unicode "🍊"))
    #(":lemon:" 0 1 (:unicode "🍋"))
    #(":banana:" 0 1 (:unicode "🍌"))
    #(":pineapple:" 0 1 (:unicode "🍍"))
    #(":apple:" 0 1 (:unicode "🍎"))
    #(":green_apple:" 0 1 (:unicode "🍏"))
    #(":pear:" 0 1 (:unicode "🍐"))
    #(":peach:" 0 1 (:unicode "🍑"))
    #(":cherries:" 0 1 (:unicode "🍒"))
    #(":strawberry:" 0 1 (:unicode "🍓"))
    #(":hamburger:" 0 1 (:unicode "🍔"))
    #(":pizza:" 0 1 (:unicode "🍕"))
    #(":meat_on_bone:" 0 1 (:unicode "🍖"))
    #(":poultry_leg:" 0 1 (:unicode "🍗"))
    #(":rice_cracker:" 0 1 (:unicode "🍘"))
    #(":rice_ball:" 0 1 (:unicode "🍙"))
    #(":rice:" 0 1 (:unicode "🍚"))
    #(":curry:" 0 1 (:unicode "🍛"))
    #(":ramen:" 0 1 (:unicode "🍜"))
    #(":spaghetti:" 0 1 (:unicode "🍝"))
    #(":bread:" 0 1 (:unicode "🍞"))
    #(":fries:" 0 1 (:unicode "🍟"))
    #(":dango:" 0 1 (:unicode "🍡"))
    #(":oden:" 0 1 (:unicode "🍢"))
    #(":sushi:" 0 1 (:unicode "🍣"))
    #(":fried_shrimp:" 0 1 (:unicode "🍤"))
    #(":fish_cake:" 0 1 (:unicode "🍥"))
    #(":icecream:" 0 1 (:unicode "🍦"))
    #(":shaved_ice:" 0 1 (:unicode "🍧"))
    #(":ice_cream:" 0 1 (:unicode "🍨"))
    #(":doughnut:" 0 1 (:unicode "🍩"))
    #(":cookie:" 0 1 (:unicode "🍪"))
    #(":chocolate_bar:" 0 1 (:unicode "🍫"))
    #(":candy:" 0 1 (:unicode "🍬"))
    #(":lollipop:" 0 1 (:unicode "🍭"))
    #(":custard:" 0 1 (:unicode "🍮"))
    #(":honey_pot:" 0 1 (:unicode "🍯"))
    #(":cake:" 0 1 (:unicode "🍰"))
    #(":bento:" 0 1 (:unicode "🍱"))
    #(":stew:" 0 1 (:unicode "🍲"))
    #(":egg:" 0 1 (:unicode "🍳"))
    #(":fork_and_knife:" 0 1 (:unicode "🍴"))
    #(":tea:" 0 1 (:unicode "🍵"))
    #(":coffee:" 0 1 (:unicode "☕"))
    #(":sake:" 0 1 (:unicode "🍶"))
    #(":wine_glass:" 0 1 (:unicode "🍷"))
    #(":cocktail:" 0 1 (:unicode "🍸"))
    #(":tropical_drink:" 0 1 (:unicode "🍹"))
    #(":beer:" 0 1 (:unicode "🍺"))
    #(":beers:" 0 1 (:unicode "🍻"))
    #(":baby_bottle:" 0 1 (:unicode "🍼"))
    #(":ribbon:" 0 1 (:unicode "🎀"))
    #(":gift:" 0 1 (:unicode "🎁"))
    #(":birthday:" 0 1 (:unicode "🎂"))
    #(":jack_o_lantern:" 0 1 (:unicode "🎃"))
    #(":christmas_tree:" 0 1 (:unicode "🎄"))
    #(":tanabata_tree:" 0 1 (:unicode "🎋"))
    #(":bamboo:" 0 1 (:unicode "🎍"))
    #(":rice_scene:" 0 1 (:unicode "🎑"))
    #(":fireworks:" 0 1 (:unicode "🎆"))
    #(":sparkler:" 0 1 (:unicode "🎇"))
    #(":tada:" 0 1 (:unicode "🎉"))
    #(":confetti_ball:" 0 1 (:unicode "🎊"))
    #(":balloon:" 0 1 (:unicode "🎈"))
    #(":dizzy:" 0 1 (:unicode "💫"))
    #(":sparkles:" 0 1 (:unicode "✨"))
    #(":collision:" 0 1 (:unicode "💥"))
    #(":mortar_board:" 0 1 (:unicode "🎓"))
    #(":crown:" 0 1 (:unicode "👑"))
    #(":dolls:" 0 1 (:unicode "🎎"))
    #(":flags:" 0 1 (:unicode "🎏"))
    #(":wind_chime:" 0 1 (:unicode "🎐"))
    #(":crossed_flags:" 0 1 (:unicode "🎌"))
    #(":lantern:" 0 1 (:unicode "🏮"))
    #(":ring:" 0 1 (:unicode "💍"))
    #(":heart:" 0 1 (:unicode "❤️"))
    #(":broken_heart:" 0 1 (:unicode "💔"))
    #(":love_letter:" 0 1 (:unicode "💌"))
    #(":two_hearts:" 0 1 (:unicode "💕"))
    #(":revolving_hearts:" 0 1 (:unicode "💞"))
    #(":heartbeat:" 0 1 (:unicode "💓"))
    #(":heartpulse:" 0 1 (:unicode "💗"))
    #(":sparkling_heart:" 0 1 (:unicode "💖"))
    #(":cupid:" 0 1 (:unicode "💘"))
    #(":gift_heart:" 0 1 (:unicode "💝"))
    #(":heart_decoration:" 0 1 (:unicode "💟"))
    #(":purple_heart:" 0 1 (:unicode "💜"))
    #(":yellow_heart:" 0 1 (:unicode "💛"))
    #(":green_heart:" 0 1 (:unicode "💚"))
    #(":blue_heart:" 0 1 (:unicode "💙"))
    #(":running:" 0 1 (:unicode "🏃"))
    #(":walking:" 0 1 (:unicode "🚶"))
    #(":dancer:" 0 1 (:unicode "💃"))
    #(":rowboat:" 0 1 (:unicode "🚣"))
    #(":swimmer:" 0 1 (:unicode "🏊"))
    #(":surfer:" 0 1 (:unicode "🏄"))
    #(":bath:" 0 1 (:unicode "🛀"))
    #(":snowboarder:" 0 1 (:unicode "🏂"))
    #(":ski:" 0 1 (:unicode "🎿"))
    #(":snowman:" 0 1 (:unicode "⛄"))
    #("️:bicyclist:" 0 1 (:unicode "️🚴"))
    #(":mountain_bicyclist:" 0 1 (:unicode "🚵"))
    #(":horse_racing:" 0 1 (:unicode "🏇"))
    #(":tent:" 0 1 (:unicode "⛺"))
    #("️:fishing_pole_and_fish:" 0 1 (:unicode "️🎣"))
    #(":soccer:" 0 1 (:unicode "⚽"))
    #("️:basketball:" 0 1 (:unicode "️🏀"))
    #(":football:" 0 1 (:unicode "🏈"))
    #(":baseball:" 0 1 (:unicode "⚾️"))
    #(":tennis:" 0 1 (:unicode "🎾"))
    #(":rugby_football:" 0 1 (:unicode "🏉"))
    #(":golf:" 0 1 (:unicode "⛳"))
    #("️:trophy:" 0 1 (:unicode "️🏆"))
    #(":running_shirt_with_sash:" 0 1 (:unicode "🎽"))
    #(":checkered_flag:" 0 1 (:unicode "🏁"))
    #(":musical_keyboard:" 0 1 (:unicode "🎹"))
    #(":guitar:" 0 1 (:unicode "🎸"))
    #(":violin:" 0 1 (:unicode "🎻"))
    #(":saxophone:" 0 1 (:unicode "🎷"))
    #(":trumpet:" 0 1 (:unicode "🎺"))
    #(":musical_note:" 0 1 (:unicode "🎵"))
    #(":notes:" 0 1 (:unicode "🎶"))
    #(":musical_score:" 0 1 (:unicode "🎼"))
    #(":headphones:" 0 1 (:unicode "🎧"))
    #(":microphone:" 0 1 (:unicode "🎤"))
    #(":performing_arts:" 0 1 (:unicode "🎭"))
    #(":ticket:" 0 1 (:unicode "🎫"))
    #(":tophat:" 0 1 (:unicode "🎩"))
    #(":circus_tent:" 0 1 (:unicode "🎪"))
    #(":clapper:" 0 1 (:unicode "🎬"))
    #(":art:" 0 1 (:unicode "🎨"))
    #(":dart:" 0 1 (:unicode "🎯"))
    #(":8ball:" 0 1 (:unicode "🎱"))
    #(":bowling:" 0 1 (:unicode "🎳"))
    #(":slot_machine:" 0 1 (:unicode "🎰"))
    #(":game_die:" 0 1 (:unicode "🎲"))
    #(":video_game:" 0 1 (:unicode "🎮"))
    #(":flower_playing_cards:" 0 1 (:unicode "🎴"))
    #(":black_joker:" 0 1 (:unicode "🃏"))
    #(":mahjong:" 0 1 (:unicode "🀄"))
    #(":carousel_horse:" 0 1 (:unicode "🎠"))
    #(":ferris_wheel:" 0 1 (:unicode "🎡"))
    #(":roller_coaster:" 0 1 (:unicode "🎢"))
    #(":train:" 0 1 (:unicode "🚃"))
    #(":mountain_railway:" 0 1 (:unicode "🚞"))
    #(":steam_locomotive:" 0 1 (:unicode "🚂"))
    #(":tram:" 0 1 (:unicode "🚋"))
    #(":monorail:" 0 1 (:unicode "🚝"))
    #(":bullettrain_side:" 0 1 (:unicode "🚄"))
    #(":bullettrain_front:" 0 1 (:unicode "🚅"))
    #(":train2:" 0 1 (:unicode "🚆"))
    #(":metro:" 0 1 (:unicode "🚇"))
    #(":light_rail:" 0 1 (:unicode "🚈"))
    #(":station:" 0 1 (:unicode "🚉"))
    #(":tram:" 0 1 (:unicode "🚊"))
    #(":bus:" 0 1 (:unicode "🚌"))
    #(":oncoming_bus:" 0 1 (:unicode "🚍"))
    #(":trolleybus:" 0 1 (:unicode "🚎"))
    #(":minibus:" 0 1 (:unicode "🚐"))
    #(":ambulance:" 0 1 (:unicode "🚑"))
    #(":fire_engine:" 0 1 (:unicode "🚒"))
    #(":police_car:" 0 1 (:unicode "🚓"))
    #(":oncoming_police_car:" 0 1 (:unicode "🚔"))
    #(":rotating_light:" 0 1 (:unicode "🚨"))
    #(":taxi:" 0 1 (:unicode "🚕"))
    #(":oncoming_taxi:" 0 1 (:unicode "🚖"))
    #(":red_car:" 0 1 (:unicode "🚗"))
    #(":oncoming_automobile:" 0 1 (:unicode "🚘"))
    #(":blue_car:" 0 1 (:unicode "🚙"))
    #(":truck:" 0 1 (:unicode "🚚"))
    #(":articulated_lorry:" 0 1 (:unicode "🚛"))
    #(":tractor:" 0 1 (:unicode "🚜"))
    #(":bike:" 0 1 (:unicode "🚲"))
    #(":busstop:" 0 1 (:unicode "🚏"))
    #(":fuelpump:" 0 1 (:unicode "⛽"))
    #(":construction:" 0 1 (:unicode "🚧"))
    #(":vertical_traffic_light:" 0 1 (:unicode "🚦"))
    #(":traffic_light:" 0 1 (:unicode "🚥"))
    #(":rocket:" 0 1 (:unicode "🚀"))
    #(":helicopter:" 0 1 (:unicode "🚁"))
    #(":airplane:" 0 1 (:unicode "✈️"))
    #(":seat:" 0 1 (:unicode "💺"))
    #(":anchor:" 0 1 (:unicode "⚓"))
    #(":ship:" 0 1 (:unicode "🚢"))
    #(":speedboat:" 0 1 (:unicode "🚤"))
    #(":sailboat:" 0 1 (:unicode "⛵"))
    #(":aerial_tramway:" 0 1 (:unicode "🚡"))
    #(":mountain_cableway:" 0 1 (:unicode "🚠"))
    #(":suspension_railway:" 0 1 (:unicode "🚟"))
    #(":passport_control:" 0 1 (:unicode "🛂"))
    #(":customs:" 0 1 (:unicode "🛃"))
    #(":baggage_claim:" 0 1 (:unicode "🛄"))
    #(":left_luggage:" 0 1 (:unicode "🛅"))
    #(":yen:" 0 1 (:unicode "💴"))
    #(":euro:" 0 1 (:unicode "💶"))
    #(":pound:" 0 1 (:unicode "💷"))
    #(":dollar:" 0 1 (:unicode "💵"))
    #(":statue_of_liberty:" 0 1 (:unicode "🗽"))
    #(":moyai:" 0 1 (:unicode "🗿"))
    #(":foggy:" 0 1 (:unicode "🌁"))
    #(":tokyo_tower:" 0 1 (:unicode "🗼"))
    #(":fountain:" 0 1 (:unicode "⛲"))
    #(":european_castle:" 0 1 (:unicode "🏰"))
    #(":japanese_castle:" 0 1 (:unicode "🏯"))
    #(":city_sunrise:" 0 1 (:unicode "🌇"))
    #(":city_sunset:" 0 1 (:unicode "🌆"))
    #(":stars:" 0 1 (:unicode "🌃"))
    #(":bridge_at_night:" 0 1 (:unicode "🌉"))
    #(":house:" 0 1 (:unicode "🏠"))
    #(":house_with_garden:" 0 1 (:unicode "🏡"))
    #(":office:" 0 1 (:unicode "🏢"))
    #(":department_store:" 0 1 (:unicode "🏬"))
    #(":factory:" 0 1 (:unicode "🏭"))
    #(":post_office:" 0 1 (:unicode "🏣"))
    #(":european_post_office:" 0 1 (:unicode "🏤"))
    #(":hospital:" 0 1 (:unicode "🏥"))
    #(":bank:" 0 1 (:unicode "🏦"))
    #(":hotel:" 0 1 (:unicode "🏨"))
    #(":love_hotel:" 0 1 (:unicode "🏩"))
    #(":wedding:" 0 1 (:unicode "💒"))
    #(":church:" 0 1 (:unicode "⛪"))
    #(":convenience_store:" 0 1 (:unicode "🏪"))
    #(":school:" 0 1 (:unicode "🏫"))
    #(":flag-au:" 0 1 (:unicode "🇦🇺"))
    #(":flag-at:" 0 1 (:unicode "🇦🇹"))
    #(":flag-be:" 0 1 (:unicode "🇧🇪"))
    #(":flag-br:" 0 1 (:unicode "🇧🇷"))
    #(":flag-ca:" 0 1 (:unicode "🇨🇦"))
    #(":flag-cl:" 0 1 (:unicode "🇨🇱"))
    #(":flag-cn:" 0 1 (:unicode "🇨🇳"))
    #(":flag-co:" 0 1 (:unicode "🇨🇴"))
    #(":flag-dk:" 0 1 (:unicode "🇩🇰"))
    #(":flag-fi:" 0 1 (:unicode "🇫🇮"))
    #(":flag-fr:" 0 1 (:unicode "🇫🇷"))
    #(":flag-de:" 0 1 (:unicode "🇩🇪"))
    #(":flag-hk:" 0 1 (:unicode "🇭🇰"))
    #(":flag-in:" 0 1 (:unicode "🇮🇳"))
    #(":flag-id:" 0 1 (:unicode "🇮🇩"))
    #(":flag-ie:" 0 1 (:unicode "🇮🇪"))
    #(":flag-il:" 0 1 (:unicode "🇮🇱"))
    #(":flag-it:" 0 1 (:unicode "🇮🇹"))
    #(":flag-jp:" 0 1 (:unicode "🇯🇵"))
    #(":flag-kr:" 0 1 (:unicode "🇰🇷"))
    #(":flag-mo:" 0 1 (:unicode "🇲🇴"))
    #(":flag-my:" 0 1 (:unicode "🇲🇾"))
    #(":flag-mx:" 0 1 (:unicode "🇲🇽"))
    #(":flag-nl:" 0 1 (:unicode "🇳🇱"))
    #(":flag-nz:" 0 1 (:unicode "🇳🇿"))
    #(":flag-no:" 0 1 (:unicode "🇳🇴"))
    #(":flag-ph:" 0 1 (:unicode "🇵🇭"))
    #(":flag-pl:" 0 1 (:unicode "🇵🇱"))
    #(":flag-pt:" 0 1 (:unicode "🇵🇹"))
    #(":flag-pr:" 0 1 (:unicode "🇵🇷"))
    #(":flag-ru:" 0 1 (:unicode "🇷🇺"))
    #(":flag-sa:" 0 1 (:unicode "🇸🇦"))
    #(":flag-sg:" 0 1 (:unicode "🇸🇬"))
    #(":flag-za:" 0 1 (:unicode "🇿🇦"))
    #(":flag-es:" 0 1 (:unicode "🇪🇸"))
    #(":flag-se:" 0 1 (:unicode "🇸🇪"))
    #(":flag-ch:" 0 1 (:unicode "🇨🇭"))
    #(":flag-tr:" 0 1 (:unicode "🇹🇷"))
    #(":flag-gb:" 0 1 (:unicode "🇬🇧"))
    #(":flag-us:" 0 1 (:unicode "🇺🇸"))
    #(":flag-ae:" 0 1 (:unicode "🇦🇪"))
    #(":flag-vn:" 0 1 (:unicode "🇻🇳"))
    #(":watch:" 0 1 (:unicode "⌚"))
    #(":iphone:" 0 1 (:unicode "📱"))
    #(":calling:" 0 1 (:unicode "📲"))
    #(":computer:" 0 1 (:unicode "💻"))
    #(":alarm_clock:" 0 1 (:unicode "⏰"))
    #(":hourglass_flowing_sand:" 0 1 (:unicode "⏳"))
    #(":hourglass:" 0 1 (:unicode "⌛"))
    #(":camera:" 0 1 (:unicode "📷"))
    #(":video_camera:" 0 1 (:unicode "📹"))
    #(":movie_camera:" 0 1 (:unicode "🎥"))
    #(":tv:" 0 1 (:unicode "📺"))
    #(":radio:" 0 1 (:unicode "📻"))
    #(":pager:" 0 1 (:unicode "📟"))
    #(":telephone_receiver:" 0 1 (:unicode "📞"))
    #(":telephone:" 0 1 (:unicode "☎️"))
    #(":fax:" 0 1 (:unicode "📠"))
    #(":minidisc:" 0 1 (:unicode "💽"))
    #(":floppy_disk:" 0 1 (:unicode "💾"))
    #(":cd:" 0 1 (:unicode "💿"))
    #(":dvd:" 0 1 (:unicode "📀"))
    #(":vhs:" 0 1 (:unicode "📼"))
    #(":battery:" 0 1 (:unicode "🔋"))
    #(":electric_plug:" 0 1 (:unicode "🔌"))
    #(":bulb:" 0 1 (:unicode "💡"))
    #(":flashlight:" 0 1 (:unicode "🔦"))
    #(":satellite:" 0 1 (:unicode "📡"))
    #(":credit_card:" 0 1 (:unicode "💳"))
    #(":money_with_wings:" 0 1 (:unicode "💸"))
    #(":moneybag:" 0 1 (:unicode "💰"))
    #(":gem:" 0 1 (:unicode "💎"))
    #(":closed_umbrella:" 0 1 (:unicode "🌂"))
    #(":pouch:" 0 1 (:unicode "👝"))
    #(":purse:" 0 1 (:unicode "👛"))
    #(":handbag:" 0 1 (:unicode "👜"))
    #(":briefcase:" 0 1 (:unicode "💼"))
    #(":school_satchel:" 0 1 (:unicode "🎒"))
    #(":lipstick:" 0 1 (:unicode "💄"))
    #(":eyeglasses:" 0 1 (:unicode "👓"))
    #(":womans_hat:" 0 1 (:unicode "👒"))
    #(":sandal:" 0 1 (:unicode "👡"))
    #(":high_heel:" 0 1 (:unicode "👠"))
    #(":boot:" 0 1 (:unicode "👢"))
    #(":shoe:" 0 1 (:unicode "👞"))
    #(":athletic_shoe:" 0 1 (:unicode "👟"))
    #(":bikini:" 0 1 (:unicode "👙"))
    #(":dress:" 0 1 (:unicode "👗"))
    #(":kimono:" 0 1 (:unicode "👘"))
    #(":womans_clothes:" 0 1 (:unicode "👚"))
    #(":tshirt:" 0 1 (:unicode "👕"))
    #(":necktie:" 0 1 (:unicode "👔"))
    #(":jeans:" 0 1 (:unicode "👖"))
    #(":door:" 0 1 (:unicode "🚪"))
    #(":shower:" 0 1 (:unicode "🚿"))
    #(":bathtub:" 0 1 (:unicode "🛁"))
    #(":toilet:" 0 1 (:unicode "🚽"))
    #(":barber:" 0 1 (:unicode "💈"))
    #(":syringe:" 0 1 (:unicode "💉"))
    #(":pill:" 0 1 (:unicode "💊"))
    #(":microscope:" 0 1 (:unicode "🔬"))
    #(":telescope:" 0 1 (:unicode "🔭"))
    #(":crystal_ball:" 0 1 (:unicode "🔮"))
    #(":wrench:" 0 1 (:unicode "🔧"))
    #(":hocho:" 0 1 (:unicode "🔪"))
    #(":nut_and_bolt:" 0 1 (:unicode "🔩"))
    #(":hammer:" 0 1 (:unicode "🔨"))
    #(":bomb:" 0 1 (:unicode "💣"))
    #(":smoking:" 0 1 (:unicode "🚬"))
    #(":gun:" 0 1 (:unicode "🔫"))
    #(":bookmark:" 0 1 (:unicode "🔖"))
    #(":newspaper:" 0 1 (:unicode "📰"))
    #(":key:" 0 1 (:unicode "🔑"))
    #(":envelope:" 0 1 (:unicode "✉️"))
    #(":envelope_with_arrow:" 0 1 (:unicode "📩"))
    #(":incoming_envelope:" 0 1 (:unicode "📨"))
    #(":e-mail:" 0 1 (:unicode "📧"))
    #(":inbox_tray:" 0 1 (:unicode "📥"))
    #(":outbox_tray:" 0 1 (:unicode "📤"))
    #(":package:" 0 1 (:unicode "📦"))
    #(":postal_horn:" 0 1 (:unicode "📯"))
    #(":postbox:" 0 1 (:unicode "📮"))
    #(":mailbox_closed:" 0 1 (:unicode "📪"))
    #(":mailbox:" 0 1 (:unicode "📫"))
    #(":mailbox_with_mail:" 0 1 (:unicode "📬"))
    #(":mailbox_with_no_mail:" 0 1 (:unicode "📭"))
    #(":page_facing_up:" 0 1 (:unicode "📄"))
    #(":page_with_curl:" 0 1 (:unicode "📃"))
    #(":bookmark_tabs:" 0 1 (:unicode "📑"))
    #(":chart_with_upwards_trend:" 0 1 (:unicode "📈"))
    #(":chart_with_downwards_trend:" 0 1 (:unicode "📉"))
    #(":bar_chart:" 0 1 (:unicode "📊"))
    #(":date:" 0 1 (:unicode "📅"))
    #(":calendar:" 0 1 (:unicode "📆"))
    #(":low_brightness:" 0 1 (:unicode "🔅"))
    #(":high_brightness:" 0 1 (:unicode "🔆"))
    #(":scroll:" 0 1 (:unicode "📜"))
    #(":clipboard:" 0 1 (:unicode "📋"))
    #(":open_book:" 0 1 (:unicode "📖"))
    #(":notebook:" 0 1 (:unicode "📓"))
    #(":notebook_with_decorative_cover:" 0 1 (:unicode "📔"))
    #(":ledger:" 0 1 (:unicode "📒"))
    #(":closed_book:" 0 1 (:unicode "📕"))
    #(":green_book:" 0 1 (:unicode "📗"))
    #(":blue_book:" 0 1 (:unicode "📘"))
    #(":orange_book:" 0 1 (:unicode "📙"))
    #(":books:" 0 1 (:unicode "📚"))
    #(":card_index:" 0 1 (:unicode "📇"))
    #(":link:" 0 1 (:unicode "🔗"))
    #(":paperclip:" 0 1 (:unicode "📎"))
    #(":pushpin:" 0 1 (:unicode "📌"))
    #(":scissors:" 0 1 (:unicode "✂️"))
    #(":triangular_ruler:" 0 1 (:unicode "📐"))
    #(":round_pushpin:" 0 1 (:unicode "📍"))
    #(":straight_ruler:" 0 1 (:unicode "📏"))
    #(":triangular_flag_on_post:" 0 1 (:unicode "🚩"))
    #(":file_folder:" 0 1 (:unicode "📁"))
    #(":open_file_folder:" 0 1 (:unicode "📂"))
    #(":black_nib:" 0 1 (:unicode "✒️"))
    #(":pencil2:" 0 1 (:unicode "✏️"))
    #(":pencil:" 0 1 (:unicode "📝"))
    #(":lock_with_ink_pen:" 0 1 (:unicode "🔏"))
    #(":closed_lock_with_key:" 0 1 (:unicode "🔐"))
    #(":lock:" 0 1 (:unicode "🔒"))
    #(":unlock:" 0 1 (:unicode "🔓"))
    #(":mega:" 0 1 (:unicode "📣"))
    #(":loudspeaker:" 0 1 (:unicode "📢"))
    #(":speakers:" 0 1 (:unicode "🔈"))
    #(":quiet_speakers:" 0 1 (:unicode "🔉"))
    #(":loud_speakers:" 0 1 (:unicode "🔊"))
    #(":mute:" 0 1 (:unicode "🔇"))
    #(":zzz:" 0 1 (:unicode "💤"))
    #(":bell:" 0 1 (:unicode "🔔"))
    #(":no_bell:" 0 1 (:unicode "🔕"))
    #(":thought_balloon:" 0 1 (:unicode "💭"))
    #(":speech_balloon:" 0 1 (:unicode "💬"))
    #(":children_crossing:" 0 1 (:unicode "🚸"))
    #(":mag:" 0 1 (:unicode "🔍"))
    #(":mag_right:" 0 1 (:unicode "🔎"))
    #(":no_entry_sign:" 0 1 (:unicode "🚫"))
    #(":no_entry:" 0 1 (:unicode "⛔"))
    #(":name_badge:" 0 1 (:unicode "📛"))
    #(":no_pedestrians:" 0 1 (:unicode "🚷"))
    #(":do_not_litter:" 0 1 (:unicode "🚯"))
    #(":no_bicycles:" 0 1 (:unicode "🚳"))
    #(":non-potable_water:" 0 1 (:unicode "🚱"))
    #(":no_mobile_phones:" 0 1 (:unicode "📵"))
    #(":underage:" 0 1 (:unicode "🔞"))
    #(":accept:" 0 1 (:unicode "🉑"))
    #(":ideograph_advantage:" 0 1 (:unicode "🉐"))
    #(":white_flower:" 0 1 (:unicode "💮"))
    #(":secret:" 0 1 (:unicode "㊙️"))
    #(":congratulations:" 0 1 (:unicode "㊗️"))
    #(":u5408:" 0 1 (:unicode "🈴"))
    #(":u6e80:" 0 1 (:unicode "🈵"))
    #(":u7981:" 0 1 (:unicode "🈲"))
    #(":u6709:" 0 1 (:unicode "🈶"))
    #(":u7121:" 0 1 (:unicode "🈚"))
    #(":u7533:" 0 1 (:unicode "🈸"))
    #(":u55b6:" 0 1 (:unicode "🈺"))
    #(":u6708:" 0 1 (:unicode "🈷"))
    #(":u5272:" 0 1 (:unicode "🈹"))
    #(":u7a7a:" 0 1 (:unicode "🈳"))
    #(":sa:" 0 1 (:unicode "🈂"))
    #(":koko:" 0 1 (:unicode "🈁"))
    #(":u6307:" 0 1 (:unicode "🈯"))
    #(":chart:" 0 1 (:unicode "💹"))
    #(":sparkle:" 0 1 (:unicode "❇️"))
    #(":eight_spoked_asterisk:" 0 1 (:unicode "✳️"))
    #(":negative_squared_cross_mark:" 0 1 (:unicode "❎"))
    #(":white_check_mark:" 0 1 (:unicode "✅"))
    #(":eight_pointed_black_star:" 0 1 (:unicode "✴️"))
    #(":vibration_mode:" 0 1 (:unicode "📳"))
    #(":mobile_phone_off:" 0 1 (:unicode "📴"))
    #(":vs:" 0 1 (:unicode "🆚"))
    #(":a:" 0 1 (:unicode "🅰"))
    #(":b:" 0 1 (:unicode "🅱"))
    #(":ab:" 0 1 (:unicode "🆎"))
    #(":cl:" 0 1 (:unicode "🆑"))
    #(":o2:" 0 1 (:unicode "🅾"))
    #(":sos:" 0 1 (:unicode "🆘"))
    #(":id:" 0 1 (:unicode "🆔"))
    #(":parking:" 0 1 (:unicode "🅿"))
    #(":wc:" 0 1 (:unicode "🚾"))
    #(":cool:" 0 1 (:unicode "🆒"))
    #(":free:" 0 1 (:unicode "🆓"))
    #(":new:" 0 1 (:unicode "🆕"))
    #(":ng:" 0 1 (:unicode "🆖"))
    #(":ok:" 0 1 (:unicode "🆗"))
    #(":up:" 0 1 (:unicode "🆙"))
    #(":atm:" 0 1 (:unicode "🏧"))
    #(":aries:" 0 1 (:unicode "♈"))
    #(":taurus:" 0 1 (:unicode "♉"))
    #(":gemini:" 0 1 (:unicode "♊"))
    #(":cancer:" 0 1 (:unicode "♋"))
    #(":leo:" 0 1 (:unicode "♌"))
    #(":virgo:" 0 1 (:unicode "♍"))
    #(":libra:" 0 1 (:unicode "♎"))
    #(":scorpius:" 0 1 (:unicode "♏"))
    #(":sagittarius:" 0 1 (:unicode "♐"))
    #(":capricorn:" 0 1 (:unicode "♑"))
    #(":aquarius:" 0 1 (:unicode "♒"))
    #(":pisces:" 0 1 (:unicode "♓"))
    #(":restroom:" 0 1 (:unicode "🚻"))
    #(":mens:" 0 1 (:unicode "🚹"))
    #(":womens:" 0 1 (:unicode "🚺"))
    #(":baby_symbol:" 0 1 (:unicode "🚼"))
    #(":wheelchair:" 0 1 (:unicode "♿"))
    #(":potable_water:" 0 1 (:unicode "🚰"))
    #(":no_smoking:" 0 1 (:unicode "🚭"))
    #(":put_litter_in_its_place:" 0 1 (:unicode "🚮"))
    #(":arrow_forward:" 0 1 (:unicode "▶️"))
    #(":arrow_backward:" 0 1 (:unicode "◀️"))
    #(":arrow_up_small:" 0 1 (:unicode "🔼"))
    #(":arrow_down_small:" 0 1 (:unicode "🔽"))
    #(":fast_forward:" 0 1 (:unicode "⏩"))
    #(":rewind:" 0 1 (:unicode "⏪"))
    #(":arrow_double_up:" 0 1 (:unicode "⏫"))
    #(":arrow_double_down:" 0 1 (:unicode "⏬"))
    #(":arrow_right:" 0 1 (:unicode "➡️"))
    #(":arrow_left:" 0 1 (:unicode "⬅️"))
    #(":arrow_up:" 0 1 (:unicode "⬆️"))
    #(":arrow_down:" 0 1 (:unicode "⬇️"))
    #(":arrow_upper_right:" 0 1 (:unicode "↗️"))
    #(":arrow_lower_right:" 0 1 (:unicode "↘️"))
    #(":arrow_lower_left:" 0 1 (:unicode "↙️"))
    #(":arrow_upper_left:" 0 1 (:unicode "↖️"))
    #(":arrow_up_down:" 0 1 (:unicode "↕️"))
    #(":left_right_arrow:" 0 1 (:unicode "↔️"))
    #(":arrows_counterclockwise:" 0 1 (:unicode "🔄"))
    #(":arrow_right_hook:" 0 1 (:unicode "↪️"))
    #(":leftwards_arrow_with_hook:" 0 1 (:unicode "↩️"))
    #(":arrow_heading_up:" 0 1 (:unicode "⤴️"))
    #(":arrow_heading_down:" 0 1 (:unicode "⤵️"))
    #(":twisted_rightwards_arrows:" 0 1 (:unicode "🔀"))
    #(":repeat:" 0 1 (:unicode "🔁"))
    #(":repeat_one:" 0 1 (:unicode "🔂"))
    #(":hashtag:" 0 1 (:unicode "#️⃣"))
    #(":keycap_zero:" 0 1 (:unicode "0️⃣"))
    #(":keycap_one:" 0 1 (:unicode "1️⃣"))
    #(":keycap_two:" 0 1 (:unicode "2️⃣"))
    #(":keycap_three:" 0 1 (:unicode "3️⃣"))
    #(":keycap_four:" 0 1 (:unicode "4️⃣"))
    #(":keycap_five:" 0 1 (:unicode "5️⃣"))
    #(":keycap_six:" 0 1 (:unicode "6️⃣"))
    #(":keycap_seven:" 0 1 (:unicode "7️⃣"))
    #(":keycap_eight:" 0 1 (:unicode "8️⃣"))
    #(":keycap_nine:" 0 1 (:unicode "9️⃣"))
    #(":keycap_ten:" 0 1 (:unicode "🔟"))
    #(":1234:" 0 1 (:unicode "🔢"))
    #(":abc:" 0 1 (:unicode "🔤"))
    #(":abcd:" 0 1 (:unicode "🔡"))
    #(":capital_abcd:" 0 1 (:unicode "🔠"))
    #(":information_source:" 0 1 (:unicode "ℹ️"))
    #(":signal_strength:" 0 1 (:unicode "📶"))
    #(":cinema:" 0 1 (:unicode "🎦"))
    #(":symbols:" 0 1 (:unicode "🔣"))
    #(":heavy_plus_sign:" 0 1 (:unicode "➕"))
    #(":heavy_minus_sign:" 0 1 (:unicode "➖"))
    #(":wavy_dash:" 0 1 (:unicode "〰"))
    #(":heavy_division_sign:" 0 1 (:unicode "➗"))
    #(":heavy_multiplication_x:" 0 1 (:unicode "✖️"))
    #(":heavy_check_mark:" 0 1 (:unicode "✔️"))
    #(":arrows_clockwise:" 0 1 (:unicode "🔃"))
    #(":trademark:" 0 1 (:unicode "™"))
    #(":copyright:" 0 1 (:unicode "©"))
    #(":registered:" 0 1 (:unicode "®"))
    #(":currency_exchange:" 0 1 (:unicode "💱"))
    #(":heavy_dollar_sign:" 0 1 (:unicode "💲"))
    #(":curly_loop:" 0 1 (:unicode "➰"))
    #(":loop:" 0 1 (:unicode "➿"))
    #(":part_alternation_mark:" 0 1 (:unicode "〽️"))
    #(":heavy_exclamation_mark:" 0 1 (:unicode "❗"))
    #(":question:" 0 1 (:unicode "❓"))
    #(":grey_exclamation:" 0 1 (:unicode "❕"))
    #(":grey_question:" 0 1 (:unicode "❔"))
    #(":double_exclamation_mark:" 0 1 (:unicode "‼️"))
    #(":interrobang:" 0 1 (:unicode "⁉️"))
    #("️:x:" 0 1 (:unicode "️❌"))
    #(":o:" 0 1 (:unicode "⭕"))
    #(":100:" 0 1 (:unicode "💯"))
    #(":end:" 0 1 (:unicode "🔚"))
    #(":back:" 0 1 (:unicode "🔙"))
    #(":on:" 0 1 (:unicode "🔛"))
    #(":top:" 0 1 (:unicode "🔝"))
    #(":soon:" 0 1 (:unicode "🔜"))
    #(":cyclone:" 0 1 (:unicode "🌀"))
    #(":m:" 0 1 (:unicode "Ⓜ️"))
    #(":ophiuchus:" 0 1 (:unicode "⛎"))
    #(":six_pointed_star:" 0 1 (:unicode "🔯"))
    #(":beginner:" 0 1 (:unicode "🔰"))
    #(":trident:" 0 1 (:unicode "🔱"))
    #(":warning:" 0 1 (:unicode "⚠️"))
    #(":hotsprings:" 0 1 (:unicode "♨️"))
    #(":recycle:" 0 1 (:unicode "♻️"))
    #(":anger:" 0 1 (:unicode "💢"))
    #(":diamond_shape_with_a_dot_inside:" 0 1 (:unicode "💠"))
    #(":spades:" 0 1 (:unicode "♠️"))
    #(":clubs:" 0 1 (:unicode "♣️"))
    #(":hearts:" 0 1 (:unicode "♥️"))
    #(":diamonds:" 0 1 (:unicode "♦️"))
    #(":ballot_box_with_check:" 0 1 (:unicode "☑️"))
    #(":white_circle:" 0 1 (:unicode "⚪"))
    #(":black_circle:" 0 1 (:unicode "⚫"))
    #(":radio_button:" 0 1 (:unicode "🔘"))
    #(":red_circle:" 0 1 (:unicode "🔴"))
    #(":large_blue_circle:" 0 1 (:unicode "🔵"))
    #(":small_red_triangle:" 0 1 (:unicode "🔺"))
    #(":small_red_triangle_down:" 0 1 (:unicode "🔻"))
    #(":small_orange_diamond:" 0 1 (:unicode "🔸"))
    #(":small_blue_diamond:" 0 1 (:unicode "🔹"))
    #(":large_orange_diamond:" 0 1 (:unicode "🔶"))
    #(":large_blue_diamond:" 0 1 (:unicode "🔷"))
    #(":black_small_square:" 0 1 (:unicode "▪️"))
    #(":white_small_square:" 0 1 (:unicode "▫️"))
    #(":black_large_square:" 0 1 (:unicode "⬛️"))
    #(":white_large_square:" 0 1 (:unicode "⬜️"))
    #(":black_medium_square:" 0 1 (:unicode "◼️"))
    #(":white_medium_square:" 0 1 (:unicode "◻️"))
    #(":black_medium_small_square:" 0 1 (:unicode "◾️"))
    #(":white_medium_small_square:" 0 1 (:unicode "◽️"))
    #(":black_square_button:" 0 1 (:unicode "🔲"))
    #(":white_square_button:" 0 1 (:unicode "🔳"))
    #(":clock1:" 0 1 (:unicode "🕐"))
    #(":clock2:" 0 1 (:unicode "🕑"))
    #(":clock3:" 0 1 (:unicode "🕒"))
    #(":clock4:" 0 1 (:unicode "🕓"))
    #(":clock5:" 0 1 (:unicode "🕔"))
    #(":clock6:" 0 1 (:unicode "🕕"))
    #(":clock7:" 0 1 (:unicode "🕖"))
    #(":clock8:" 0 1 (:unicode "🕗"))
    #(":clock9:" 0 1 (:unicode "🕘"))
    #(":clock10:" 0 1 (:unicode "🕙"))
    #(":clock11:" 0 1 (:unicode "🕚"))
    #(":clock12:" 0 1 (:unicode "🕛"))
    #(":clock130:" 0 1 (:unicode "🕜"))
    #(":clock230:" 0 1 (:unicode "🕝"))
    #(":clock330:" 0 1 (:unicode "🕞"))
    #(":clock430:" 0 1 (:unicode "🕟"))
    #(":clock530:" 0 1 (:unicode "🕠"))
    #(":clock630:" 0 1 (:unicode "🕡"))
    #(":clock730:" 0 1 (:unicode "🕢"))
    #(":clock830:" 0 1 (:unicode "🕣"))
    #(":clock930:" 0 1 (:unicode "🕤"))
    #(":clock1030:" 0 1 (:unicode "🕥"))
    #(":clock1130:" 0 1 (:unicode "🕦"))
    #(":clock1230:" 0 1 (:unicode "🕧"))
    #(":skin-tone-1:" 0 1 (:unicode "🏿"))
    #(":skin-tone-2:" 0 1 (:unicode "🏾"))
    #(":skin-tone-3:" 0 1 (:unicode "🏽"))
    #(":skin-tone-4:" 0 1 (:unicode "🏼"))
    #(":skin-tone-5:" 0 1 (:unicode "🏻"))
    )
  )

(defun company-emoji-annotation (s)
  "Return a formatted annotation for completion candidate S."
  (format " %s" (get-text-property 0 :unicode s)))

;;;###autoload
(defun company-emoji (command &optional arg &rest ignored)
  "Provide a backend for company to complete emoji-words.

company.el calls this function, and passes a COMMAND to it that
depends on the context: 'prefix', 'candidates', 'annotation',
etc.  In some contexts it also passes ARG, which is the list of
candidates that match what has been typed so far.  Sometimes ARG
is a single candidate, as when COMMAND is 'annotation' or
'post-completion'.  Other arguments are IGNORED."
  (cl-case command
    ;; 'prefix' has too many meanings in emacs lisp but here we're
    ;; specifying what the string we're completing should begin with
    (prefix (company-grab "\:[a-zA-Z0-9-]*"))
    (candidates
      ;; filter based on what's already been typed
      (cl-remove-if-not
        (lambda (c) (string-prefix-p arg c))
        (company-emoji-list)))
    ;; show the real emoji alongside its name in the completion list
    (annotation (company-emoji-annotation arg))
    ;; when we find the emoji we want, replace it with the real emoji
    (post-completion
      (kill-region (- (point) (length arg)) (point))
      (insert (get-text-property 0 :unicode arg)))))

;;;###autoload
(defun company-emoji-init ()
  "Add emoji to the company backends."
  (interactive)
  (company-mode 1)
  (add-to-list 'company-backends 'company-emoji))

(provide 'company-emoji)

;;; company-emoji.el ends here
