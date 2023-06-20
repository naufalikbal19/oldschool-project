public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == Register)
        {
            new nombrejugador[MAX_PLAYER_NAME], archivo[256];
            if (!strlen(inputtext)) return ShowPlayerDialog(playerid, Register, DIALOG_STYLE_INPUT, "Old School Roleplay - Register", "He writes your password", "Acept", "Cancel");
            if (!response) return ShowPlayerDialog(playerid, Register, DIALOG_STYLE_INPUT, "Old School Roleplay - Register", "He writes your password:", "Acept", "Cancel");
            GetPlayerName(playerid, nombrejugador, sizeof(nombrejugador));
            format(archivo, sizeof(archivo), "/Users/%s.ini", nombrejugador);
            dini_Create(archivo);
            dini_Set(archivo, "User", nombrejugador);
            dini_Set(archivo, "Password", inputtext);
            ShowPlayerDialog(playerid, Logged, DIALOG_STYLE_INPUT, "Old School Roleplay - Login", "He writes your password", "Acept", "Cancel");
        }
    if (dialogid == Logged)
        {
            new nombrejugador[MAX_PLAYER_NAME], archivo[256], comprobante[256];
            if (!strlen(inputtext)) return ShowPlayerDialog(playerid, Logged, DIALOG_STYLE_INPUT, "Old School Roleplay - Login", "He writes your password", "Acept", "Cancel");
            if (!response) return ShowPlayerDialog(playerid, Logged, DIALOG_STYLE_INPUT, "Old School Roleplay - Login", "He writes your password", "Acept", "Cancel");
            GetPlayerName(playerid, nombrejugador, sizeof(nombrejugador));
            format(archivo, sizeof(archivo), "/Users/%s.ini", nombrejugador);
            format(comprobante, sizeof(comprobante), "%s", dini_Get(archivo, "Password"));
            if (!strcmp (inputtext, comprobante))
            {
                Login[playerid] = 1;
            }
            else
            {
                ShowPlayerDialog(playerid, Logged, DIALOG_STYLE_INPUT, "Old School Roleplay - Login", "He writes your password", "Acept", "Cancel");
            }
        }
    return 1;
}