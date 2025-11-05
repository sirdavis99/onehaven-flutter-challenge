OneHaven Flutter Developer 
Challenge
PRIVILEGED & CONFIDENTIAL  INTERNAL USE ONL Y
🧾  O v e r v i e w
Build a small, pr oduction-minded Flut ter app that simulat es the Car egiv er 
dashbo ard exper ience in OneHa ven. The app should demonstrat e solid  
architectur e, st ate management, API int egration, r esponsiv eness, and user  
exper ience on r eal de vices. Emphasis is on deliv ering a cle an, t estable, and w ell-
document ed solution that could be e xtended int o the r eal pr oduct.
🎯  S c e n a r i o  ( R e a l i s t i c  c o n t e x t )
Caregiv ers log int o the OneHa ven app, vie w a list of their Pr otected Members, and  
perform simple actions (t oggle a scr een-time contr ol, vie w det ails). The app  
should w ork against a mock ed or light weight b ackend (w eʼll pr ovide a small  
sample JSON API endpoint or c andidat es c an mock one ). Real-w orld beha viors  
such as lo ading st ates, er ror handling, and loc al caching should be implement ed. 
The app should function against a light weight b ackend or mock API t o simulat e 
real-w orld dat a flo w. Focus on r ealistic app beha vior, including lo ading, of fline  
mode, and smooth na vigation - as if this w ere a pr oduction build.
🔧  R e q u i r e m e n t s  ( M u s t - h a v e )
1 )  C o r e  s c r e e n s
Build a Flut ter app with at le ast t wo scr eens :
Login Scr een (mock auth)
Email & p assw ord input s with v alidation ( email f ormat + r equir ed fields)
On “login ˮ, store a mock t oken and na vigat e to Dashbo ard
OneHa ven Flut ter De veloper Challenge
1

Dashbo ard / Member List
Displa ys a list of Pr otected Members (name, age, st atus, small a vatar)
Each list it em sho ws a Screen Time  toggle ( on/of f)
Clicking an it em na vigat es to Member Det ails (simple r ead-onl y vie w with  
full fields)
2 )  D a t a  s o u r c e
Fetch member list fr om a REST endpoint ( candidat es c an use a public JSON  
service or a pr ovided mock ser ver).
For the pur pose of the t est, you must pr ovide a small seed JSON f ile or 
instructions in README if using a public API ( e.g., JSONPlaceholder with  
transf ormed schema).
Implement pull-t o-refresh on the dashbo ard.
3 )  S t a t e  m a n a g e m e n t
Use Provider , Riverpod, or Bloc  (choose one ). Use ar chitectur e patterns 
cleanly (sep arate UI, st ate, ser vice la yers).
4 )  U X  /  R e s i l i e n c e
Show sk eleton or spinner st ates while lo ading.
Show friendl y error UI f or net work failur e with a “r etryˮ action.
Ensur e UI is r esponsiv e (por trait on phone; also r easonable on small t ablet).
5 )  L o c a l  p e r s i s t e n c e  ( r e q u i r e d )
Cache the member list loc ally using Hive or Shar edPr eferences  so that the  
app displa ys c ached dat a offline and r efreshes when online.
The Scr een Time t oggle st ate must be persist ed loc ally and synced with the  
remot e API when online (simulat e sync beha vior if using mock API.
⚙  E x e c u t i o n  /  H o w  t o  r u n  ( m u s t  b e  i n  R E A D M E )
OneHa ven Flut ter De veloper Challenge
2

Provide Flut ter SDK v ersion used.
Steps t o run:
g i t  c l o n e  < r e p o >
f l u t t e r  p u b  g e t
f l u t t e r  r u n (or st eps t o inst all APK
Use a mock b ackend for dat a fetching. Include cle ar setup instructions in y our 
README ( e.g., ho w to start the mock ser ver: n o d e  m o c k - s e r v e r . j s) and provide the  
sample JSON structur e used f or responses (lik e the e xample belo w). No liv e 
backend or host ed API is r equir ed.
E x a m p l e  J S O N  S t r u c t u r e
[
  {
    "id": "m001" ,
    "firstName ": "Emma" ,
    "lastName ": "T est",
    "birthYear" 2010 ,
    "relationship ": "Daught er",
    "avatar": "ht tps://e xample.com/a vatar1.png" ,
    "status": "activ e",
    "scr eenTimeEnabled": true
  },
  ...
]
📦  D e l i v e r a b l e s
GitHub r eposit ory (public ) OR ZIP with:
Full Flut ter pr oject
OneHa ven Flut ter De veloper Challenge
3

R E A D M E . m d with setup instructions, ar chitectur e not es, and AI usage  
summar y
C H A N G E L O G . m d with dail y progress bullet s (requir ed)
APK ( optional but pr eferred for quick Q A
Shor t 23 min) Loom/scr een r ecor ding sho wing the app running and a  
quick walkthr ough ( optional but r ecommended)
Impor tant:  Commit s should be pushed at le ast once per da y (or at e very major  
progress checkpoint) t o reflect de velopment pr ogress transp arently. Commit  
messages should be descr iptiv e and cle ar lik e: f e a t :  a d d  m e m b e r  e n t i t y  a n d  m o d e l s or 
f i x :  h a n d l e  o f f l i n e  s t a t e.
Suggest ed Deliv erables t ext for the r epo README ( copyable ):
## Deliv erables
 GitHub r epo link (shar e once cr eated)
 Dail y commit s pushed t o the r epo t o demonstrat e progress
 README setup, ar chitectur e, design decisions, AI Usage Summar y
 Optional: APK and shor t demo video
🧮  E v a l u a t i o n  R u b r i c
Cat egor y W eight
UI Implement ation & UX (lo ading, er rors, r esponsiv eness) 30%
State management & ar chitectur e (clean sep aration) 25%
Offline persist ence & sync logic 20%
Code qualit y & comment s 15%
Commit s / Communic ation / README 10%
Scor e not es: Bonus point s for widget t ests or int egration t ests, good accessibilit y 
practices, and a w ell-made demo video.
🔐  A I  P o l i c y
OneHa ven Flut ter De veloper Challenge
4

AI tools ar e allowed but must be declar ed:
In README include A I  U s a g e  S u m m a r y that list s what t ools w ere used (if an y) and  
how the y were used.
Submit ting AI-pr oduced code without  underst anding / e xplanation is a  
negativ e indic ator.
🧾  Submission
Send complet ed pr oject link t o the r ecruitment coor dinat ors Summit & Henr y) or  
via GitHub access in vitation.
Include y our name , email , and role in the submission message.
✅  B o n u s  /  S t r e t c h  G o a l s  ( o p t i o n a l )
Candidat es c an e arn extra cr edit f or an y of these:
Add widget/unit t ests for a cor e widget or pr ovider .
Implement push-lik e loc al notific ations when Scr een Time t oggles (simulat e).
Add a small “ sync st atusˮ indic ator sho wing queued changes vs synced.
Small accessible impr ovement s (labels f or scr een r eaders).
OneHa ven Flut ter De veloper Challenge
5