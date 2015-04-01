
(defun open-my-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :view 'month
   :contents-sources
   (list 
    (cfw:ical-create-source
     "my calendar" 
     "https://www.google.com/calendar/ical/klc55fh1ldedqe2qonvuf4jehs%40group.calendar.google.com/private-33fb0547bd934d0cc1c9568dfa7077da/basic.ics"
     "Pink")
    (cfw:ical-create-source
     "naist"
     "https://www.google.com/calendar/ical/klc55fh1ldedqe2qonvuf4jehs%40group.calendar.google.com/private-33fb0547bd934d0cc1c9568dfa7077da/basic.ics"
     "#2952a3"))))

(use-package calfw
  :if (and (require 'calfw-ical) (require 'calfw-gcal))
  :init
  (bind-keys :map cfw:calendar-mode-map
             ("a" . cfw:gcal-main)))
