
CLS
SCREEN _NEWIMAGE(1500, 900, 8)
RANDOMIZE TIMER

'Title Screen

DO
    'Starts Game
    'Sets Playing Field
    left = 200
    top = 200

    right = 1300
    bottom = 700

    'Sets Spawn Point for Player
    px = 750
    py = 475

    '**Resets Variables
    fin = 0
    col = 4
    col2 = 9
    go = 0
    multi = 0
    hpadd = 15
    ps = 3 ‘Player speed

    health1 = 100
    health2 = 100

    heal1 = 0
    heal2 = 0
    heal3 = 0

    'Menu Variable Reset
    rndbullet = 0
    borderflkr = 0
    selectcol = 14
    heal = 0
    level = 0
    okay = 0
    hc = 0

    c1 = 8
    c2 = 8
    c3 = 8
    c4 = 14
    c5 = 8

    h1 = 2
    h2 = 8
    h3 = 8
    h4 = 8

    '***SETTINGS MENU***
    DO
        CLS
        COLOR 15
        infoexist = _MOUSEINPUT

        'Alows only one click
        click = _MOUSEBUTTON(1)

        IF click <> 0 THEN
            click1 = 1
        END IF

        'Text
        LOCATE 3, 3
        PRINT "MENU"
        LOCATE 4, 3
        PRINT "_________________"

        LOCATE 9, 3
        PRINT "RANDOMIZE BULLET SPAWNS"

        LOCATE 13, 3
        PRINT "CHANGE HIT COLOR"

        COLOR c1
        LOCATE 13, 30
        PRINT "WHITE"

        COLOR c2
        LOCATE 13, 39
        PRINT "BLACK"

        COLOR c3
        LOCATE 13, 49
        PRINT "GREEN"

        COLOR c4
        LOCATE 13, 58
        PRINT "YELLOW"

        COLOR c5
        LOCATE 13, 69
        PRINT "OFF"


        COLOR 15
        LOCATE 18, 3
        PRINT "BORDER FLICKER ON"

        LOCATE 22, 3
        PRINT "HEALING"

        LOCATE 26, 3
        PRINT "DIFFICULTY"

        COLOR h1
        LOCATE 26, 31
        PRINT "EASY"

        COLOR h2
        LOCATE 26, 39
        PRINT "MEDIUM"

        COLOR h3
        LOCATE 26, 49
        PRINT "HARD"

        COLOR h4
        LOCATE 26, 58
        PRINT "EXPERT"


        COLOR 15
        LOCATE 9, 85
        PRINT "INFO (mouse over a setting)"

        LOCATE 32, 3
        PRINT "RULES"

        LOCATE 35, 5
        PRINT "MOVEMENT"
        LOCATE 36, 5
        PRINT "Use 'WASD' or arrow keys to move around the screen."

        LOCATE 39, 5
        PRINT "DAMAGE"
        LOCATE 40, 5
        PRINT "Damage is done 'per tick.' This means that the longer you are touching an obstacle, the more it will hurt."
        LOCATE 41, 5
        PRINT "You start with 100 health. Bigger bullets do more damage."

        LOCATE 44, 5


        PRINT "SPAWNS"
        LOCATE 45, 5
        PRINT "All bullets will spawn in one of the corners of the field."

        LOCATE 48, 5
        PRINT "OBJECT"
        LOCATE 49, 5
        PRINT "The object of the game is to live as long as possible."

        'Finish
        LOCATE 60, 56
        PRINT "1 PLAYER"
        LOCATE 60, 80
        PRINT "2 PLAYERS"


        'MENU INFO
        'Spawns
        IF (_MOUSEX >= 15 AND _MOUSEX <= 255) AND (_MOUSEY >= 55 AND _MOUSEY <= 75) THEN
            LOCATE 12, 87
            PRINT "Bullets are programmed to spawn at the same location"
            LOCATE 13, 87
            PRINT "every game."

            LOCATE 16, 87
            PRINT "This setting makes it so all spawns are randomized"
            LOCATE 17, 87
            PRINT "for a unique game each time."
        END IF

        'Color
        IF (_MOUSEX >= 10 AND _MOUSEX <= 590) AND (_MOUSEY >= 85 AND _MOUSEY <= 115) THEN
            LOCATE 12, 87
            PRINT "When struck, the player avatar flickers."

            LOCATE 15, 87
            PRINT "This setting changes the color of the flickers,"
            LOCATE 16, 87
            PRINT "or disables it altogether."
        END IF

        'Border
        IF (_MOUSEX >= 15 AND _MOUSEX <= 255) AND (_MOUSEY >= 120 AND _MOUSEY <= 150) THEN
            LOCATE 12, 87
            PRINT "The border around the playing field is static by default."

            LOCATE 15, 87
            PRINT "This setting enables a border animation that makes it"
            LOCATE 16, 87
            PRINT "easier to distinguish when you're taking damage."
        END IF

        'Healing
        IF (_MOUSEX >= 15 AND _MOUSEX <= 255) AND (_MOUSEY >= 155 AND _MOUSEY <= 190) THEN
            LOCATE 12, 87
            PRINT "There is no healing in the game by default."

            LOCATE 15, 87
            PRINT "This setting will spawn three healing orbs that heal 15HP"
            LOCATE 16, 87

        END IF

        'Difficulty
        IF (_MOUSEX >= 10 AND _MOUSEX <= 515) AND (_MOUSEY >= 190 AND _MOUSEY <= 230) THEN
            LOCATE 12, 87
            PRINT "Easy - The default game. Damage is low and bullets"
            LOCATE 13, 87
            PRINT "spawn until 25 seconds."

            LOCATE 16, 87
            PRINT "Medium - Damage is slightly increased. Bullets"
            LOCATE 17, 87
            PRINT "spawn until 45 seconds."

            LOCATE 20, 87
            PRINT "Hard - Damage is drastically increased. Bullets"
            LOCATE 21, 87
            PRINT "spawn until 1 minute."

            LOCATE 24, 87
            PRINT "Expert - Start with 1 HP. Bullets"
            LOCATE 25, 87
            PRINT "spawn until 1 minute. Healing will not work."
        END IF

        'Players
        IF (_MOUSEX >= 380 AND _MOUSEX <= 570) AND (_MOUSEY >= 445 AND _MOUSEY <= 500) THEN
            LOCATE 12, 87
            PRINT "Solo Mode - Work to get the best time you"
            LOCATE 13, 87
            PRINT "can!"
        END IF

        IF (_MOUSEX >= 580 AND _MOUSEX <= 770) AND (_MOUSEY >= 445 AND _MOUSEY <= 500) THEN
            LOCATE 12, 87
            PRINT "Vs. Mode - Try to live longer than your"
            LOCATE 13, 87
            PRINT "opponent."

            LOCATE 16, 87
            PRINT "Player 1 appears as a red heart. They are controlled by 'WASD'"
            LOCATE 18, 87
            PRINT "Player 2 appears as a blue heart. They are controlled by the"
            LOCATE 19, 87
            PRINT "arrow keys."
        END IF


        'Boxes
        'Random Bullet Spawns
        LINE (225, 55)-(245, 75), 7, B

        'Hit Color Changes
        LINE (225, 90)-(280, 110), c1, B
        LINE (300, 90)-(355, 110), c2, B
        LINE (375, 90)-(430, 110), c3, B
        LINE (450, 90)-(505, 110), c4, B
        LINE (525, 90)-(580, 110), c5, B

        'Border Flicker
        LINE (225, 125)-(245, 145), 7, B

        'Healing
        LINE (225, 160)-(245, 180), 7, B

        'Difficulty
        LINE (225, 195)-(280, 215), h1, B
        LINE (300, 195)-(355, 215), h2, B
        LINE (375, 195)-(430, 215), h3, B
        LINE (450, 195)-(505, 215), h4, B

        'TEXT BOX
        LINE (675, 80)-(1180, 230), 7, B

        'Rules Box
        LINE (15, 260)-(1180, 420), 7, B

        'BEGIN
        '575
        LINE (380, 450)-(570, 500), 7, B
        LINE (580, 450)-(770, 500), 7, B

        'Checks for Mouse Input
        'Random Bullet Spawns
        IF (_MOUSEX >= 225 AND _MOUSEX <= 245) AND (_MOUSEY >= 55 AND _MOUSEY <= 75) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            IF rndbullet = 0 THEN
                rndbullet = 1
            ELSEIF rndbullet = 1 THEN
                rndbullet = 0
            END IF
        END IF

        'Colors
        IF (_MOUSEX >= 225 AND _MOUSEX <= 280) AND (_MOUSEY >= 90 AND _MOUSEY <= 110) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            selectcol = 15
            c1 = 15
            c2 = 8
            c3 = 8
            c4 = 8
            c5 = 8
        ELSEIF (_MOUSEX >= 300 AND _MOUSEX <= 355) AND (_MOUSEY >= 90 AND _MOUSEY <= 110) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            selectcol = 0
            c1 = 8
            c2 = 7
            c3 = 8
            c4 = 8
            c5 = 8
        ELSEIF (_MOUSEX >= 375 AND _MOUSEX <= 430) AND (_MOUSEY >= 90 AND _MOUSEY <= 110) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            selectcol = 2
            c1 = 8
            c2 = 8
            c3 = 2
            c4 = 8
            c5 = 8
        ELSEIF (_MOUSEX >= 450 AND _MOUSEX <= 505) AND (_MOUSEY >= 90 AND _MOUSEY <= 110) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            selectcol = 14
            c1 = 8
            c2 = 8
            c3 = 8
            c4 = 14
            c5 = 8
        ELSEIF (_MOUSEX >= 525 AND _MOUSEX <= 580) AND (_MOUSEY >= 90 AND _MOUSEY <= 110) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            selectcol = 4
            c1 = 8
            c2 = 8
            c3 = 8
            c4 = 8
            c5 = 7
        END IF


        'Flicker
        IF (_MOUSEX >= 225 AND _MOUSEX <= 245) AND (_MOUSEY >= 125 AND _MOUSEY <= 145) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            IF borderflkr = 0 THEN
                borderflkr = 1
            ELSEIF borderflkr = 1 THEN
                borderflkr = 0
            END IF
        END IF

        'Heal
        IF (_MOUSEX >= 225 AND _MOUSEX <= 245) AND (_MOUSEY >= 160 AND _MOUSEY <= 180) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            IF heal = 0 THEN
                heal = 1

                heal1 = 1
                heal2 = 1
                heal3 = 1
            ELSEIF heal = 1 THEN
                heal = 0

                heal1 = 0
                heal2 = 0
                heal3 = 0
            END IF
        END IF

        'Difficulty
        IF (_MOUSEX >= 225 AND _MOUSEX <= 280) AND (_MOUSEY >= 195 AND _MOUSEY <= 215) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            level = 0
            h1 = 2
            h2 = 8
            h3 = 8
            h4 = 8
        ELSEIF (_MOUSEX >= 300 AND _MOUSEX <= 355) AND (_MOUSEY >= 195 AND _MOUSEY <= 215) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            level = 1
            h1 = 8
            h2 = 14
            h3 = 8
            h4 = 8
        ELSEIF (_MOUSEX >= 375 AND _MOUSEX <= 430) AND (_MOUSEY >= 195 AND _MOUSEY <= 215) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            level = 2
            h1 = 8
            h2 = 8
            h3 = 6
            h4 = 8
        ELSEIF (_MOUSEX >= 450 AND _MOUSEX <= 500) AND (_MOUSEY >= 195 AND _MOUSEY <= 215) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            level = 2
            hc = 1
            h1 = 8
            h2 = 8
            h3 = 8
            h4 = 4
        END IF

        'Finished
        IF (_MOUSEX >= 380 AND _MOUSEX <= 570) AND (_MOUSEY >= 450 AND _MOUSEY <= 500) THEN
            LINE (379, 449)-(571, 501), 7, B
            LINE (378, 448)-(572, 502), 7, B
        END IF

        IF (_MOUSEX >= 380 AND _MOUSEX <= 570) AND (_MOUSEY >= 450 AND _MOUSEY <= 500) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            multi = 0
            okay = 1
        END IF

        '(580, 450)-(770, 500)

        IF (_MOUSEX >= 580 AND _MOUSEX <= 770) AND (_MOUSEY >= 450 AND _MOUSEY <= 500) THEN
            LINE (579, 449)-(771, 501), 7, B
            LINE (578, 448)-(772, 502), 7, B
        END IF

        IF (_MOUSEX >= 580 AND _MOUSEX <= 770) AND (_MOUSEY >= 450 AND _MOUSEY <= 500) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            multi = 1
            okay = 1
        END IF


        'Changes Menu Based on Clicks
        IF rndbullet = 1 THEN
            COLOR 2
            LINE (226, 64)-(232, 74)
            LINE (225, 63)-(231, 74)

            LINE (232, 75)-(245, 55)
        END IF

        IF borderflkr = 1 THEN
            COLOR 2
            LINE (226, 134)-(232, 144)
            LINE (225, 133)-(231, 144)

            LINE (232, 145)-(245, 125)
        END IF

        IF heal = 1 THEN
            COLOR 2
            LINE (226, 169)-(232, 179)
            LINE (225, 168)-(231, 179)

            LINE (232, 180)-(245, 160)
        END IF


        COLOR 15
        _DISPLAY
    LOOP UNTIL okay <> 0

    'FINAL VARIABLES
    IF selectcol <> 4 THEN
        hitcol = selectcol
        hitcol2 = selectcol
    ELSE
        hitcol = selectcol
        hitcol2 = 9
    END IF

    '***END OF SETTINGS MENU***

    'Player Spawns
    IF multi = 1 THEN
        px = 600
        py = 475

        p2x = 900
        p2y = 475
    END IF

    'Determines Damage Values
    IF level = 0 THEN
        dmg1 = 3
        dmg2 = 5
        dmg3 = 8
    ELSEIF level = 1 THEN
        dmg1 = 5
        dmg2 = 7
        dmg3 = 10
    ELSEIF level = 2 THEN
        dmg1 = 8
        dmg2 = 10
        dmg3 = 15
    END IF

    IF hc = 1 THEN
        dmg1 = 1
        dmg2 = 1
        dmg3 = 1

        health1 = 1
        health2 = 1
        hpadd = 0
    ELSE
        health1 = 100
        health2 = 100
        hpadd = 15
    END IF


    'Bullet Spawns
    IF rndbullet = 0 THEN
        x1 = left
        y1 = top

        x2 = right
        y2 = top

        x3 = left
        y3 = top

        x4 = right
        y4 = bottom

        x5 = left
        y5 = bottom

        x6 = right
        y6 = top

        x7 = left
        y7 = bottom

        x8 = right
        y8 = top

        x9 = right
        y9 = bottom

        x10 = left
        y10 = top

        x11 = left
        y11 = bottom
        '---
        x12 = left
        y12 = top

        x13 = right
        y13 = bottom

        x14 = right
        y14 = bottom

        x15 = left
        y15 = top
        '---
        x16 = right
        y16 = top

        x17 = left
        y17 = bottom

        x18 = left
        y18 = top

        '---
        x19 = right
        y19 = top

        x20 = left
        y20 = top

        x21 = right
        y21 = bottom
        '---

    ELSEIF rndbullet = 1 THEN
        CALL hori(x1, left, right)
        CALL verti(y1, top, bottom)

        CALL hori(x2, left, right)
        CALL verti(y2, top, bottom)

        CALL hori(x3, left, right)
        CALL verti(y3, top, bottom)

        CALL hori(x4, left, right)
        CALL verti(y4, top, bottom)

        CALL hori(x5, left, right)
        CALL verti(y5, top, bottom)

        CALL hori(x6, left, right)
        CALL verti(y6, top, bottom)

        CALL hori(x7, left, right)
        CALL verti(y7, top, bottom)

        CALL hori(x8, left, right)
        CALL verti(y8, top, bottom)

        CALL hori(x9, left, right)
        CALL verti(y9, top, bottom)

        CALL hori(x10, left, right)
        CALL verti(y10, top, bottom)

        CALL hori(x11, left, right)
        CALL verti(y11, top, bottom)
        '---
        CALL hori(x12, left, right)
        CALL verti(y12, top, bottom)

        CALL hori(x13, left, right)
        CALL verti(y13, top, bottom)

        CALL hori(x14, left, right)
        CALL verti(y14, top, bottom)

        CALL hori(x15, left, right)
        CALL verti(y15, top, bottom)
        '---
        CALL hori(x16, left, right)
        CALL verti(y16, top, bottom)

        CALL hori(x17, left, right)
        CALL verti(y17, top, bottom)

        CALL hori(x18, left, right)
        CALL verti(y18, top, bottom)
        '---
        x19 = right
        y19 = top

        x20 = left
        y20 = top

        x21 = right
        y21 = bottom

    END IF

    num = TIMER

    'Initializes Game

    DO
        CLS
        'Displays Timer
        time = INT((TIMER - num) * 10) / 10
        LOCATE 25, 154
        PRINT "TIME:"; time

        'Resets Player Color
        col = 4
        col2 = 9
        hit1 = 0
        hit2 = 0

        'Draws Exterior Box
        CALL board(left, top, right, bottom)


        'Allows Player to Move
        IF multi = 0 THEN
            IF _KEYDOWN(20480) THEN
                py = py + ps
            ELSEIF _KEYDOWN(115) THEN
                py = py + ps
            END IF

            IF _KEYDOWN(18432) THEN
                py = py - ps
            ELSEIF _KEYDOWN(119) THEN
                py = py - ps
            END IF

            IF _KEYDOWN(19200) THEN
                px = px - ps
            ELSEIF _KEYDOWN(97) THEN
                px = px - ps
            END IF

            IF _KEYDOWN(19712) THEN
                px = px + ps
            ELSEIF _KEYDOWN(100) THEN
                px = px + ps
            END IF

        ELSEIF multi = 1 THEN
            IF _KEYDOWN(20480) THEN
                p2y = p2y + ps
            END IF

            IF _KEYDOWN(115) THEN
                py = py + ps
            END IF

            IF _KEYDOWN(18432) THEN
                p2y = p2y - ps
            END IF

            IF _KEYDOWN(119) THEN
                py = py - ps
            END IF

            IF _KEYDOWN(19200) THEN
                p2x = p2x - ps
            END IF

            IF _KEYDOWN(97) THEN
                px = px - ps
            END IF

            IF _KEYDOWN(19712) THEN
                p2x = p2x + ps
            END IF

            IF _KEYDOWN(100) THEN
                px = px + ps
            END IF
        END IF

        'Does not allow player to move outside the board
        IF px > right - 9 THEN
            px = right - 9
        END IF

        IF px < left + 9 THEN
            px = left + 9
        END IF

        IF py > bottom THEN
            py = bottom - 1
        END IF
        IF py < top + 17 THEN
            py = top + 17
        END IF

        IF multi = 1 THEN
            IF p2x > right - 9 THEN
                p2x = right - 9
            END IF

            IF p2x < left + 9 THEN
                p2x = left + 9
            END IF

            IF p2y > bottom THEN
                p2y = bottom - 1
            END IF
            IF p2y < top + 17 THEN
                p2y = top + 17
            END IF
        END IF



        'Calls Objects Based on Time
        'Assigns Variables

        IF time > 0 THEN
            'Bounces Bullet 1
            CALL bounce(top, bottom, left, right, x1, y1, k1, f1, 1)

            'Moves Bullets Along Path
            y1 = y1 + 2 * k1
            x1 = x1 + 2 * f1

            CALL bullet(x1, y1)
        END IF

        IF time > 1 THEN
            'Bounces Bullet 2
            CALL bounce(top, bottom, left, right, x2, y2, k2, f2, 1)

            'Moves Bullets Along Path
            y2 = y2 + 1.5 * k2
            x2 = x2 + 2 * f2

            CALL bullet(x2, y2)
        END IF

        IF time > 2 THEN
            'Bounces Bullet 3
            CALL bounce(top, bottom, left, right, x3, y3, k3, f3, 1)

            'Moves Bullets Along Path
            y3 = y3 + 2 * k3
            x3 = x3 + 2.75 * f3

            CALL bullet(x3, y3)
        END IF

        IF time > 3 THEN
            'Bounces Bullet 4
            CALL bounce(top, bottom, left, right, x4, y4, k4, f4, 1)

            'Moves Bullets Along Path
            y4 = y4 + 3 * k4
            x4 = x4 + 1 * f4

            CALL bullet(x4, y4)

            IF time > 4 THEN
                'Bounces Bullet 5
                CALL bounce(top, bottom, left, right, x5, y5, k5, f5, 1)

                'Moves Bullets Along Path
                y5 = y5 + 2.5 * k5
                x5 = x5 + 2 * f5

                CALL bullet(x5, y5)
            END IF

            IF time > 5 THEN
                'Bounces Bullet 6
                CALL bounce(top, bottom, left, right, x6, y6, k6, f6, 1)

                'Moves Bullets Along Path
                y6 = y6 + 2.25 * k6
                x6 = x6 + 4 * f6

                CALL bullet(x6, y6)
            END IF

            'STAGGER SPAWNS
            IF time > 10 THEN
                'Bounces Bullet 7
                CALL bounce(top, bottom, left, right, x7, y7, k7, f7, 2)

                'Moves Bullets Along Path
                y7 = y7 + 2 * k7
                x7 = x7 + 1.7 * f7

                CALL bullet2(x7, y7)
            END IF

            IF time > 15 THEN
                'Bounces Bullet 8
                CALL bounce(top, bottom, left, right, x8, y8, k8, f8, 1)

                'Moves Bullets Along Path
                y8 = y8 + 2.3 * k8
                x8 = x8 + 1.85 * f8

                CALL bullet(x8, y8)
            END IF

            IF time > 20 THEN
                'Bounces Bullet 9
                CALL bounce(top, bottom, left, right, x9, y9, k9, f9, 3)

                'Moves Bullets Along Path
                y9 = y9 + 2.3 * k9
                x9 = x9 + 1.85 * f9

                CALL bullet3(x9, y9)
            END IF

            IF time > 25 THEN
                'Bounces Bullet 10
                CALL bounce(top, bottom, left, right, x10, y10, k10, f10, 2)

                'Moves Bullets Along Path
                y10 = y10 + 1.34 * k10
                x10 = x10 + 1.43 * f10

                CALL bullet2(x10, y10)
            END IF

            'Medium and Hard Spawns
            IF level = 1 OR level = 2 THEN

                IF time > 30 THEN
                    'Bullet 11
                    CALL bounce(top, bottom, left, right, x11, y11, k11, f11, 1)

                    'Moves Bullets Along Path
                    y11 = y11 + 2.15 * k11
                    x11 = x11 + 2.13 * f11

                    CALL bullet(x11, y11)
                END IF

                IF time > 34 THEN
                    'Bullet 12
                    CALL bounce(top, bottom, left, right, x12, y12, k12, f12, 2)

                    'Moves Bullets Along Path
                    y12 = y12 + 2.5 * k12
                    x12 = x12 + 2.32 * f12

                    CALL bullet2(x12, y12)
                END IF

                IF time > 39 THEN
                    'Bullet 13
                    CALL bounce(top, bottom, left, right, x13, y13, k13, f13, 1)

                    'Moves Bullets Along Path
                    y13 = y13 + 2.15 * k13
                    x13 = x13 + 2.13 * f13

                    CALL bullet(x13, y13)
                END IF

                IF time > 42 THEN
                    'Bullet 14
                    CALL bounce(top, bottom, left, right, x14, y14, k14, f14, 1)

                    'Moves Bullets Along Path
                    y14 = y14 + 2.15 * k14
                    x14 = x14 + 2.13 * f14

                    CALL bullet(x14, y14)
                END IF

                IF time > 45 THEN
                    'Bullet 15
                    CALL bounce(top, bottom, left, right, x15, y15, k15, f15, 3)

                    'Moves Bullets Along Path
                    y15 = y15 + .9 * k15
                    x15 = x15 + 1.2 * f15

                    CALL bullet3(x15, y15)
                END IF

            END IF

            'Hard Spawns
            IF level = 2 THEN
                IF time > 48 THEN
                    'Bullet 16
                    CALL bounce(top, bottom, left, right, x16, y16, k16, f16, 1)

                    'Moves Bullets Along Path
                    y16 = y16 + 1.3 * k16
                    x16 = x16 + 2.17 * f16

                    CALL bullet(x16, y16)
                END IF

                IF time > 55 THEN
                    'Bullet 17
                    CALL bounce(top, bottom, left, right, x17, y17, k17, f17, 2)

                    'Moves Bullets Along Path
                    y17 = y17 + 2.15 * k17
                    x17 = x17 + 2.13 * f17

                    CALL bullet2(x17, y17)
                END IF

                IF time > 60 THEN
                    'Bullet 18
                    CALL bounce(top, bottom, left, right, x18, y18, k18, f18, 3)

                    'Moves Bullets Along Path
                    y18 = y18 + .9 * k18
                    x18 = x18 + 1.2 * f18

                    CALL bullet3(x18, y18)
                END IF
            END IF


            IF time > 2 THEN
                'Healing Orbs
                IF heal1 = 1 THEN
                    CALL bounce(top, bottom, left, right, x19, y19, k19, f19, 1)

                    'Moves Bullets Along Path
                    y19 = y19 + .5 * k19
                    x19 = x19 + .56 * f19

                    CALL heals(x19, y19)
                END IF

                IF heal2 = 1 THEN
                    CALL bounce(top, bottom, left, right, x20, y20, k20, f20, 1)

                    'Moves Bullets Along Path
                    y20 = y20 + .6 * k20
                    x20 = x20 + .4 * f20

                    CALL heals(x20, y20)
                END IF

                IF heal3 = 1 THEN
                    CALL bounce(top, bottom, left, right, x21, y21, k21, f21, 1)

                    'Moves Bullets Along Path
                    y21 = y21 + .63 * k21
                    x21 = x21 + .54 * f21

                    CALL heals(x21, y21)
                END IF

            END IF
        END IF


        'Determines if Player 1 is hit
        'Initial Spawns
        '** Small Bullet
        IF px - 8 <= x1 AND x1 <= px + 8 AND py - 20 <= y1 AND y1 < py THEN
            health1 = health1 - dmg1
            col = hitcol
            hit1 = 1
        END IF
        IF px - 8 <= x2 AND x2 <= px + 8 AND py - 20 <= y2 AND y2 < py THEN
            health1 = health1 - dmg1
            col = hitcol
            hit1 = 1
        END IF
        IF px - 8 <= x3 AND x3 <= px + 8 AND py - 20 <= y3 AND y3 < py THEN
            health1 = health1 - dmg1
            col = hitcol
            hit1 = 1
        END IF
        IF px - 8 <= x4 AND x4 <= px + 8 AND py - 20 <= y4 AND y4 < py THEN
            health1 = health1 - dmg1
            col = hitcol
            hit1 = 1
        END IF
        IF px - 8 <= x5 AND x5 <= px + 8 AND py - 20 <= y5 AND y5 < py THEN
            health1 = health1 - dmg1
            col = hitcol
            hit1 = 1
        END IF
        IF px - 8 <= x6 AND x6 <= px + 8 AND py - 20 <= y6 AND y6 < py THEN
            health1 = health1 - dmg1
            col = hitcol
            hit1 = 1
        END IF

        'Staggered Spawns
        '** Med Bullet
        IF px - 13 <= x7 AND x7 <= px + 13 AND py - 25 <= y7 AND y7 < py + 5 THEN
            health1 = health1 - dmg2
            col = hitcol
            hit1 = 1
        END IF

        IF px - 8 <= x8 AND x8 <= px + 8 AND py - 20 <= y8 AND y8 < py THEN
            health1 = health1 - dmg1
            col = hitcol
            hit1 = 1
        END IF
        IF px - 8 <= x9 AND x9 <= px + 8 AND py - 20 <= y9 AND y9 < py THEN
            health1 = health1 - dmg1
            col = hitcol
            hit1 = 1
        END IF
        IF px - 13 <= x10 AND x10 <= px + 13 AND py - 25 <= y10 AND y10 < py + 5 THEN
            health1 = health1 - dmg2
            col = hitcol
            hit1 = 1
        END IF

        '** Large Bullet
        IF px - 16 <= x9 AND x9 <= px + 16 AND py - 28 <= y9 AND y9 < py + 8 THEN
            health1 = health1 - dmg3
            col = hitcol
            hit1 = 1
        END IF

        IF px - 13 <= x10 AND x10 <= px + 13 AND py - 25 <= y10 AND y10 < py + 5 THEN
            health1 = health1 - dmg2
            col = hitcol
            hit1 = 1
        END IF


        'Medium and Hard Spawns Hitboxes
        IF level = 1 OR level = 2 THEN
            IF px - 8 <= x11 AND x11 <= px + 8 AND py - 20 <= y11 AND y11 < py THEN
                health1 = health1 - dmg1
                col = hitcol
                hit1 = 1
            END IF

            IF px - 13 <= x12 AND x12 <= px + 13 AND py - 25 <= y12 AND y12 < py + 5 THEN
                health1 = health1 - dmg2
                col = hitcol
                hit1 = 1
            END IF

            IF px - 8 <= x13 AND x13 <= px + 8 AND py - 20 <= y13 AND y13 < py THEN
                health1 = health1 - dmg1
                col = hitcol
                hit1 = 1
            END IF
            IF px - 8 <= x14 AND x14 <= px + 8 AND py - 20 <= y14 AND y14 < py THEN
                health1 = health1 - dmg1
                col = hitcol
                hit1 = 1
            END IF

            IF px - 16 <= x15 AND x15 <= px + 16 AND py - 28 <= y15 AND y15 < py + 8 THEN
                health1 = health1 - dmg3
                col = hitcol
                hit1 = 1
            END IF
        END IF

        'Hard Spawns Hiboxes
        IF level = 2 THEN

            IF level = 1 OR level = 2 THEN
                IF px - 8 <= x16 AND x16 <= px + 8 AND py - 20 <= y16 AND y16 < py THEN
                    health1 = health1 - dmg1
                    col = hitcol
                    hit1 = 1
                END IF

                IF px - 13 <= x17 AND x17 <= px + 13 AND py - 25 <= y17 AND y17 < py + 5 THEN
                    health1 = health1 - dmg2
                    col = hitcol
                    hit1 = 1
                END IF

                IF px - 16 <= x18 AND x18 <= px + 16 AND py - 28 <= y18 AND y18 < py + 8 THEN
                    health1 = health1 - dmg3
                    col = hitcol
                    hit1 = 1
                END IF

            END IF
        END IF

        'Healing Hitboxes
        IF heal1 = 1 THEN
            IF px - 8 <= x19 AND x19 <= px + 8 AND py - 20 <= y19 AND y19 < py THEN
                heal1 = 0
                health1 = health1 + hpadd
                IF health1 > 100 THEN health1 = 100
            END IF
        END IF

        IF heal2 = 1 THEN
            IF px - 8 <= x20 AND x20 <= px + 8 AND py - 20 <= y20 AND y20 < py THEN
                heal2 = 0
                health1 = health1 + hpadd
                IF health1 > 100 THEN health1 = 100
            END IF
        END IF

        IF heal3 = 1 THEN
            IF px - 8 <= x21 AND x21 <= px + 8 AND py - 20 <= y21 AND y21 < py THEN
                heal3 = 0
                health1 = health1 + hpadd
                IF health1 > 100 THEN health1 = 100
            END IF
        END IF

        IF multi = 1 THEN
            'Determines if Player 2 is hit
            'Initial Spawns
            '** Small Bullet
            IF p2x - 8 <= x1 AND x1 <= p2x + 8 AND p2y - 20 <= y1 AND y1 < p2y THEN
                health2 = health2 - dmg1
                col2 = hitcol2
                hit2 = 1
            END IF
            IF p2x - 8 <= x2 AND x2 <= p2x + 8 AND p2y - 20 <= y2 AND y2 < p2y THEN
                health2 = health2 - dmg1
                col2 = hitcol2
                hit2 = 1
            END IF
            IF p2x - 8 <= x3 AND x3 <= p2x + 8 AND p2y - 20 <= y3 AND y3 < p2y THEN
                health2 = health2 - dmg1
                col2 = hitcol2
                hit2 = 1
            END IF
            IF p2x - 8 <= x4 AND x4 <= p2x + 8 AND p2y - 20 <= y4 AND y4 < p2y THEN
                health2 = health2 - dmg1
                col2 = hitcol2
                hit2 = 1
            END IF
            IF p2x - 8 <= x5 AND x5 <= p2x + 8 AND p2y - 20 <= y5 AND y5 < p2y THEN
                health2 = health2 - dmg1
                col2 = hitcol2
                hit2 = 1
            END IF
            IF p2x - 8 <= x6 AND x6 <= p2x + 8 AND p2y - 20 <= y6 AND y6 < p2y THEN
                health2 = health2 - dmg1
                col2 = hitcol2
                hit2 = 1
            END IF

            'Staggered Spawns
            '** Med Bullet
            IF p2x - 13 <= x7 AND x7 <= p2x + 13 AND p2y - 25 <= y7 AND y7 < p2y + 5 THEN
                health2 = health2 - dmg2
                col2 = hitcol2
                hit2 = 1
            END IF

            IF p2x - 8 <= x8 AND x8 <= p2x + 8 AND p2y - 20 <= y8 AND y8 < p2y THEN
                health2 = health2 - dmg1
                col2 = hitcol2
                hit2 = 1
            END IF
            IF p2x - 8 <= x9 AND x9 <= p2x + 8 AND p2y - 20 <= y9 AND y9 < p2y THEN
                health2 = health2 - dmg1
                col2 = hitcol2
                hit2 = 1
            END IF
            IF p2x - 13 <= x10 AND x10 <= p2x + 13 AND p2y - 25 <= y10 AND y10 < p2y + 5 THEN
                health2 = health2 - dmg2
                col2 = hitcol2
                hit2 = 1
            END IF

            '** Large Bullet
            IF p2x - 16 <= x9 AND x9 <= p2x + 16 AND p2y - 28 <= y9 AND y9 < p2y + 8 THEN
                health2 = health2 - dmg3
                col2 = hitcol2
                hit2 = 1
            END IF

            IF p2x - 13 <= x10 AND x10 <= p2x + 13 AND p2y - 25 <= y10 AND y10 < p2y + 5 THEN
                health2 = health2 - dmg2
                col2 = hitcol2
                hit2 = 1
            END IF


            'Medium and Hard Spawns Hitboxes
            IF level = 1 OR level = 2 THEN
                IF p2x - 8 <= x11 AND x11 <= p2x + 8 AND p2y - 20 <= y11 AND y11 < p2y THEN
                    health2 = health2 - dmg1
                    col2 = hitcol2
                    hit2 = 1
                END IF

                IF p2x - 13 <= x12 AND x12 <= p2x + 13 AND p2y - 25 <= y12 AND y12 < p2y + 5 THEN
                    health2 = health2 - dmg2
                    col2 = hitcol2
                    hit2 = 1
                END IF

                IF p2x - 8 <= x13 AND x13 <= p2x + 8 AND p2y - 20 <= y13 AND y13 < p2y THEN
                    health2 = health2 - dmg1
                    col2 = hitcol2
                    hit2 = 1
                END IF
                IF p2x - 8 <= x14 AND x14 <= p2x + 8 AND p2y - 20 <= y14 AND y14 < p2y THEN
                    health2 = health2 - dmg1
                    col2 = hitcol2
                    hit2 = 1
                END IF

                IF p2x - 16 <= x15 AND x15 <= p2x + 16 AND p2y - 28 <= y15 AND y15 < p2y + 8 THEN
                    health2 = health2 - dmg3
                    col2 = hitcol2
                    hit2 = 1
                END IF
            END IF

            'Hard Spawns Hiboxes
            IF level = 2 THEN

                IF level = 1 OR level = 2 THEN
                    IF p2x - 8 <= x16 AND x16 <= p2x + 8 AND p2y - 20 <= y16 AND y16 < p2y THEN
                        health2 = health2 - dmg1
                        col2 = hitcol2
                        hit2 = 1
                    END IF

                    IF p2x - 13 <= x17 AND x17 <= p2x + 13 AND p2y - 25 <= y17 AND y17 < p2y + 5 THEN
                        health2 = health2 - dmg2
                        col2 = hitcol2
                        hit2 = 1
                    END IF

                    IF p2x - 16 <= x18 AND x18 <= p2x + 16 AND p2y - 28 <= y18 AND y18 < p2y + 8 THEN
                        health2 = health2 - dmg3
                        col2 = hitcol2
                        hit2 = 1
                    END IF

                END IF
            END IF

            'Healing Hitboxes
            IF heal1 = 1 THEN
                IF p2x - 8 <= x19 AND x19 <= p2x + 8 AND p2y - 20 <= y19 AND y19 < p2y THEN
                    heal1 = 0
                    health2 = health2 + hpadd
                    IF health2 > 100 THEN health2 = 100
                END IF
            END IF

            IF heal2 = 1 THEN
                IF p2x - 8 <= x20 AND x20 <= p2x + 8 AND p2y - 20 <= y20 AND y20 < p2y THEN
                    heal2 = 0
                    health2 = health2 + hpadd
                    IF health2 > 100 THEN health2 = 100
                END IF
            END IF

            IF heal3 = 1 THEN
                IF p2x - 8 <= x21 AND x21 <= p2x + 8 AND p2y - 20 <= y21 AND y21 < p2y THEN
                    heal3 = 0
                    health2 = health2 + hpadd
                    IF health2 > 100 THEN health2 = 100
                END IF
            END IF
        END IF


        'HP Bar Colors
        IF health1 > 50 THEN
            hpcol = 2
        ELSEIF health1 > 20 THEN
            hpcol = 14
        ELSEIF health1 > 5 THEN
            hpcol = 4
        ELSEIF health1 <= 0 THEN
            hpcol = 4
            fin = 1
            health1 = 0
        END IF

        IF multi = 1 THEN
            IF health2 > 50 THEN
                hpcol2 = 2
            ELSEIF health2 > 20 THEN
                hpcol2 = 14
            ELSEIF health2 > 5 THEN
                hpcol2 = 4
            ELSEIF health2 <= 0 THEN
                hpcol2 = 4
                fin = 2
                health2 = 0
            END IF
        END IF

        'Hit Graphics Changes

        'Border Flicker
        IF multi = 0 THEN
            IF borderflkr = 1 THEN
                IF hit1 = 1 THEN
                    LINE (left - 1, top + 1)-(right + 1, bottom + 1), , B
                    LINE (left - 2, top + 2)-(right + 2, bottom + 2), , B
                    LINE (left - 3, top + 3)-(right + 3, bottom + 3), , B
                END IF
            END IF
        ELSEIF multi = 1 THEN
            IF borderflkr = 1 THEN
                IF hit1 = 1 THEN
                    LINE (left - 1, top + 1)-(right + 1, bottom + 1), , B
                    LINE (left - 2, top + 2)-(right + 2, bottom + 2), , B
                    LINE (left - 3, top + 3)-(right + 3, bottom + 3), , B
                END IF

                IF hit2 = 1 THEN
                    LINE (left - 1, top + 1)-(right + 1, bottom + 1), , B
                    LINE (left - 2, top + 2)-(right + 2, bottom + 2), , B
                    LINE (left - 3, top + 3)-(right + 3, bottom + 3), , B
                END IF
            END IF
        END IF


        'Displays Health
        CALL hp(left, top, right, bottom, health1, hpcol)

        IF multi = 1 THEN
            LOCATE 90, 123
            PRINT "HEALTH PLAYER 2:"; health2; "/ 100"
            LINE (right - 102, bottom + 14)-((right), bottom + 21), 7, B
            LINE (right - 101, bottom + 15)-((right - 101) + health2, bottom + 20), hpcol2, BF
        END IF

        'Displays Player
        CALL player(px, py, col)

        IF multi = 1 THEN
            CALL player(p2x, p2y, col2)
        END IF

        _DISPLAY
    LOOP UNTIL fin = 1 OR fin = 2

    okay = 0
    click1 = 0

    IF multi = 1 THEN
        'Assign Winner
        IF fin = 1 THEN
            winner = 2
        ELSEIF fin = 2 THEN
            winner = 1
        END IF


    END IF

    DO
        CLS
        infoexist = _MOUSEINPUT

        'Alows only one click
        click = _MOUSEBUTTON(1)

        IF click <> 0 THEN
            click1 = 1
        END IF

        CALL board(left, top, right, bottom)
        CALL hp(left, top, right, bottom, health1, hpcol)

        IF multi = 1 THEN
            LOCATE 90, 123
            PRINT "HEALTH PLAYER 2:"; health2; "/ 100"
            LINE (right - 102, bottom + 14)-((right), bottom + 21), 7, B
            LINE (right - 101, bottom + 15)-((right - 101) + health2, bottom + 20), hpcol2, BF
        END IF


        'Text
        LOCATE 25, 154
        PRINT "TIME:"; time

        LOCATE 65, 89
        PRINT "PLAY  AGAIN"

        LOCATE 71, 93
        PRINT "END"

        IF multi = 0 THEN
            LOCATE 55, 90
            PRINT "GAME OVER"
        ELSEIF multi = 1 THEN
            LOCATE 57, 87
            PRINT "PLAYER"; winner; "WINS!"
        END IF

        'Determine Winner


        'Box
        LINE (675, 495)-(820, 530), 15, B
        LINE (700, 550)-(790, 580), 15, B

        'Play Again
        IF (_MOUSEX >= 675 AND _MOUSEX <= 820) AND (_MOUSEY >= 495 AND _MOUSEY <= 530) THEN
            LINE (674, 494)-(821, 531), 7, B
            LINE (673, 493)-(822, 532), 7, B
        END IF

        IF (_MOUSEX >= 675 AND _MOUSEX <= 820) AND (_MOUSEY >= 495 AND _MOUSEY <= 530) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            okay = 1
            go = 1
        END IF

        'Quit
        IF (_MOUSEX >= 700 AND _MOUSEX <= 790) AND (_MOUSEY >= 550 AND _MOUSEY <= 580) THEN
            LINE (699, 549)-(791, 581), 7, B
            LINE (698, 548)-(792, 582), 7, B
        END IF

        IF (_MOUSEX >= 700 AND _MOUSEX <= 790) AND (_MOUSEY >= 550 AND _MOUSEY <= 580) AND (click1 = 1 AND click = 0) THEN
            click1 = 0
            okay = 1
            go = 0
        END IF

        _DISPLAY
    LOOP UNTIL okay = 1
LOOP UNTIL go = 0

'Credits
CLS
CALL board(left, top, right, bottom)
LOCATE 55, 82
PRINT "Game Created by Cole Wentzel"
LOCATE 56, 81
PRINT "in Mr. Craver's 2017 CIS I Class."


_DISPLAY
_DELAY 5
SYSTEM


'----------------SUBS
'Game Models***

'HP Bar
SUB hp (left, top, right, bottom, health, hpcol)
LOCATE 90, 26
PRINT "HEALTH:"; health; "/ 100"
LINE (left + 149, bottom + 14)-((left + 251), bottom + 21), 7, B
LINE (left + 150, bottom + 15)-((left + 150) + health, bottom + 20), hpcol, BF
END SUB


'****Creates player model
SUB player (x, y, col)
'Sides of heart
LINE (x, y)-(x - 8, y - 10), col
LINE (x, y)-(x + 8, y - 10), col

'Fill in Middle
FOR z = -8 TO 8
    LINE (x, y)-(x - z, y - 10), col
NEXT z

'Add Top
CIRCLE (x + 4, y - 12), 4, col, , , 1
PAINT (x + 4, y - 12), col

CIRCLE (x - 4, y - 12), 4, col, , , 1
PAINT (x - 4, y - 12), col
END SUB

'****Sets Playing Field
SUB board (left, top, right, bottom)
'Playing Field
LINE (left, top)-(right, bottom), , B

'Border
FOR add = 0 TO 5
    LINE (0 + add, 0 + add)-(1500 - add, 900 - add), 4, B
NEXT add
END SUB

'****Bullet
SUB bullet (x, y)
CIRCLE (x, y), 3, 15, , , 1
PAINT (x, y), 15
END SUB

'****Bullet 2
SUB bullet2 (x, y)
CIRCLE (x, y), 5, 15, , , 1
PAINT (x, y), 15
END SUB

'****Bullet 3
SUB bullet3 (x, y)
CIRCLE (x, y), 8, 15, , , 1
PAINT (x, y), 15
END SUB


'Heal
'****Bullet
SUB heals (x, y)
CIRCLE (x, y), 3, 2, , , 1
PAINT (x, y), 2
END SUB



'____________________

'Random Movement
'****Bounce
SUB bounce (top, bottom, left, right, x, y, k, f, bull)

'Smallest Bullet
IF bull = 1 THEN
    IF y <= top + 3 THEN
        k = 1
    ELSEIF y >= bottom - 3 THEN
        k = -1
    END IF

    IF x <= left + 3 THEN
        f = 1
    ELSEIF x >= right - 3 THEN
        f = -1
    END IF
END IF

'Medium Bullet
IF bull = 2 THEN
    IF y <= top + 5 THEN
        k = 1
    ELSEIF y >= bottom - 5 THEN
        k = -1
    END IF

    IF x <= left + 5 THEN
        f = 1
    ELSEIF x >= right - 5 THEN
        f = -1
    END IF
END IF

'Large Bullet
IF bull = 3 THEN
    IF y <= top + 8 THEN
        k = 1
    ELSEIF y >= bottom - 8 THEN
        k = -1
    END IF

    IF x <= left + 8 THEN
        f = 1
    ELSEIF x >= right - 8 THEN
        f = -1
    END IF
END IF
END SUB

'***Spawns
SUB hori (X, left, right)
num = INT(RND * 2) + 1
IF num = 1 THEN
    X = left
ELSEIF num = 2 THEN
    X = right
END IF
END SUB

SUB verti (Y, top, bottom)
num = INT(RND * 2) + 1
IF num = 1 THEN
    Y = top
ELSEIF num = 2 THEN
    Y = bottom
END IF
END SUB