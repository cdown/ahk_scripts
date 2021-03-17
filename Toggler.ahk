mode = 0
Return

Joy4::
    switch mode {
	case 0: Send, {h 23}{j 1}
	case 1: Send, {y 23}{u 1}
    }

    mode := Mod(mode + 1, 2)
Return
