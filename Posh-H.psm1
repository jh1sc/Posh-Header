Function Header {
    $script:DN = Add-Type -AssemblyName  Microsoft.VisualBasic, PresentationCore, PresentationFramework, System.Drawing, System.Windows.Forms, WindowsBase, WindowsFormsIntegration, System;
    $script:ASKS = Add-Type -MemberDefinition '[DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)]public static extern short GetAsyncKeyState(int virtualKeyCode);' -Name "Win32GetAsyncKeyState" -Namespace Win32Functions -PassThru
    $script:Max = Add-Type -MemberDefinition '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);' -name NativeMethods -namespace Win32
    $script:Fnt = Add-Type -TypeDefinition 'namespace Windows.Native{using System;using System.ComponentModel;using System.IO;using System.Runtime.InteropServices;public class Kernel32{public const uint FILE_SHARE_READ = 1;public const uint FILE_SHARE_WRITE = 2;public const uint GENERIC_READ = 0x80000000;public const uint GENERIC_WRITE = 0x40000000;public static readonly IntPtr INVALID_HANDLE_VALUE = new IntPtr(-1);public const int STD_ERROR_HANDLE = -12;public const int STD_INPUT_HANDLE = -10;public const int STD_OUTPUT_HANDLE = -11;[StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]public class CONSOLE_FONT_INFOEX{private int cbSize;public CONSOLE_FONT_INFOEX(){this.cbSize = Marshal.SizeOf(typeof(CONSOLE_FONT_INFOEX));}public int FontIndex;public short FontWidth;public short FontHeight;public int FontFamily;public int FontWeight;[MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)]public string FaceName;}public class Handles{public static readonly IntPtr StdIn = GetStdHandle(STD_INPUT_HANDLE);public static readonly IntPtr StdOut = GetStdHandle(STD_OUTPUT_HANDLE);public static readonly IntPtr StdErr = GetStdHandle(STD_ERROR_HANDLE);}[DllImport("kernel32.dll", SetLastError=true)]public static extern bool CloseHandle(IntPtr hHandle);[DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]public static extern IntPtr CreateFile([MarshalAs(UnmanagedType.LPTStr)] string filename,uint access,uint share,IntPtr securityAttributes, [MarshalAs(UnmanagedType.U4)] FileMode creationDisposition,uint flagsAndAttributes,IntPtr templateFile);[DllImport("kernel32.dll", CharSet=CharSet.Unicode, SetLastError=true)]public static extern bool GetCurrentConsoleFontEx(IntPtr hConsoleOutput, bool bMaximumWindow, [In, Out] CONSOLE_FONT_INFOEX lpConsoleCurrentFont);[DllImport("kernel32.dll", SetLastError=true)]public static extern IntPtr GetStdHandle(int nStdHandle);[DllImport("kernel32.dll", SetLastError=true)]public static extern bool SetCurrentConsoleFontEx(IntPtr ConsoleOutput, bool MaximumWindow,[In, Out] CONSOLE_FONT_INFOEX ConsoleCurrentFontEx);public static IntPtr CreateFile(string fileName, uint fileAccess, uint fileShare, FileMode creationDisposition){IntPtr hFile = CreateFile(fileName, fileAccess, fileShare, IntPtr.Zero, creationDisposition, 0U, IntPtr.Zero);if (hFile == INVALID_HANDLE_VALUE){throw new Win32Exception();}return hFile;}public static CONSOLE_FONT_INFOEX GetCurrentConsoleFontEx(){IntPtr hFile = IntPtr.Zero;try{hFile = CreateFile("CONOUT$", GENERIC_READ,FILE_SHARE_READ | FILE_SHARE_WRITE, FileMode.Open);return GetCurrentConsoleFontEx(hFile);}finally{CloseHandle(hFile);}}public static void SetCurrentConsoleFontEx(CONSOLE_FONT_INFOEX cfi){IntPtr hFile = IntPtr.Zero;try{hFile = CreateFile("CONOUT$", GENERIC_READ | GENERIC_WRITE,FILE_SHARE_READ | FILE_SHARE_WRITE, FileMode.Open);SetCurrentConsoleFontEx(hFile, false, cfi);}finally{CloseHandle(hFile);}}public static CONSOLE_FONT_INFOEX GetCurrentConsoleFontEx(IntPtr outputHandle){CONSOLE_FONT_INFOEX cfi = new CONSOLE_FONT_INFOEX();if (!GetCurrentConsoleFontEx(outputHandle, false, cfi)){throw new Win32Exception();}return cfi;}}}'
}

function ASKS {
    param ([System.Windows.Forms.Keys]$Key) 
    $Vk = [System.Windows.Forms.Keys]
    $script:ASKS::GetAsyncKeyState($Vk::$Key)
}

Function Set-Font {
    param
    ($FontIndex, $FontWidth, $FontHeight, $FontFamily, $FontWeight, $FaceName)
    $FontAspects = $script:Fnt::GetCurrentConsoleFontEx()
    $FontAspects.FontIndex = $FontIndex; $FontAspects.FontWidth = $FontWidth
    $FontAspects.FontHeight = $FontHeight; $FontAspects.FontFamily = $FontFamily
    $FontAspects.FontWeight = $FontWeight; $FontAspects.FaceName = $FaceName
    $script:Fnt::SetCurrentConsoleFontEx($FontAspects)
}