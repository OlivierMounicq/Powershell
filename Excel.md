# Excel file & PowerShell

Create an CSV file

```ps1
PS C:\Users\Home> "FirstName;LastName;Country;" > PersonList.csv
PS C:\Users\Home> "Emmanuel;Macron;FR;" >> PersonList.csv
PS C:\Users\Home> "Donald;Trump;US;" >> PersonList.csv
PS C:\Users\Home> "Boris;Jonhnson;UK;" >> PersonList.csv
```

```ps1
$objExcel = New-Object -ComObject Excel.Application;
$objExcel.Visible = $false;
$workBook = $objExcel.Workbooks.Add();
$workSheet = $workBook.Sheets.Item(1);

$idRow = 1;

$workSheet.Cells.Item($idRow, 1) = "FirstName";
$workSheet.Cells.Item($idRow, 2) = "LastName";
$workSheet.Cells.Item($idRow, 3) = "Country";

(Get-Content .\PersonList.csv | ConvertFrom-Csv -Delimiter ';' ) | %{
$idRow++;
$workSheet.Cells.Item($idRow, 1) = $_.FirstName;
$workSheet.Cells.Item($idRow, 2) = $_.LastName;
$workSheet.Cells.Item($idRow, 3) = $_.Country;

if($_.Country -eq "US"){ $workSheet.Range("A$idRow","C$idRow").Font.ColorIndex = 5; }
if($_.Country -eq "FR"){ $workSheet.Range("A$idRow","C$idRow").Interior.ColorIndex = 36; }
}

$workSheet.UsedRange.Columns.Autofit();
$workSheet.Application.ActiveWindow.SplitRow = 1;
$workSheet.Application.ActiveWindow.FreezePanes = $true;

$workBook.SaveAs("C:\Users\Home\PersonList.xlsx");
$workBook.Close();
$objExcel.Quit();
```

