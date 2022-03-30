_header.contentType('pdf')

var pdfDocument = _pdf.newDocument(_pdf.pageSize('A5'));

var title = _pdf.font(_storage.filesystem('server', 'samples/export-pdf', 'FiraSans-Bold.ttf'), true);
var text = _pdf.font(_storage.filesystem('server', 'samples/export-pdf', 'FiraSans-Regular.ttf'), true);

const logo =  _pdf.image(_storage.filesystem('server', 'samples/export-pdf', 'logo.png'))
.scaleAbsolute(120, 36)

const pointColumnWidths = ["150F", "150F"]; 
const table = _pdf.table(pointColumnWidths);
//table.getDefaultCell().setBorder(com.itextpdf.text.Rectangle.NO_BORDER);

const cell1 = _pdf.cell();
const cell2 = _pdf.cell();
cell1.setBorder(com.itextpdf.layout.border.Border.NO_BORDER);

cell1.add(logo);
//cell1.setBorder(new com.itextpdf.layout.borders.SolidBorder(com.itextpdf.kernel.colors.ColorConstants.RED, 2));
//cell1.setBorder(com.itextpdf.text.Rectangle.NO_BORDER);
cell2.add(logo);
table.addCell(cell1);
table.addCell(cell2);

pdfDocument.add(
    table
 )
 
pdfDocument.add(
   logo
)

pdfDocument.add(
    _pdf.paragraph('My Custom Font!')
        .setFont(title)
        .setFontSize(22)
        .setFontColor(_pdf.color("#1abc9c"))
)

pdfDocument.add(
    _pdf.paragraph('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.!')
        .setFont(text)
        .setFontSize(12)
)

pdfDocument.close()