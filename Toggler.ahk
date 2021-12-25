SetKeyDelay, 300
mode = 0
Return

Joy4::
    switch mode {
	case 0: Send, {h 25}
	case 1: Send, {y 25}
    }

    mode := Mod(mode + 1, 2)
Return
