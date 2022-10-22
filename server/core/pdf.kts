
/**
 *
 *  EN: Export PDF
 *  EN: Generates a PDF file in realtime showing some kind of content features.
 *
 *  PT: Export PDF
 *  PT: Gera um ficheiro PDF em tempo real mostrando alguns tipos de recursos de conteúdo.
 *
 */

fun generatePDF(invoiceData: Values, companyData: Values, customerData: Values, productsData: List<Values>) {

    //_header.contentType("pdf");
    //val pdfDocument = _pdf.newDocument(_pdf.pageSize("A4"));
    val pdfDocument = _pdf.newDocument(
        _storage.filesystem("private", "finance", invoiceData.getInt("id") + ".pdf"), _pdf.pageSize("A4")
    )
    
    pdfDocument.add(_pdf.paragraph(""));
    val pdfPDFDocument = _pdf.getPdfDocument();
    val width = _pdf.pageSize("A4").getWidth().toDouble();
    val height = _pdf.pageSize("A4").getHeight().toDouble();

    val title = _pdf.font(_storage.filesystem("server", "samples/export-pdf", "FiraSans-Bold.ttf"), true);
    val text = _pdf.font(_storage.filesystem("server", "samples/export-pdf", "FiraSans-Regular.ttf"), true);
    val titleSize = 25.toFloat();
    val textSize = 12.toFloat();
    val smallSize = 10.toFloat();
    val textColor = _pdf.color("#3d3838");
    val lightTextColor = _pdf.color("#726969");
    val twoColumnWidths = floatArrayOf(750f, 400f);
    val twoSameColumnWidths = floatArrayOf((width/2).toFloat(), (height/2).toFloat());
    val treeOfSixColumnWidths = floatArrayOf((width/6).toFloat(), (width/6).toFloat(),(width/6).toFloat());
    val treeColumnWidths = floatArrayOf((width/3).toFloat(), (width/3).toFloat(),(width/3).toFloat());

    val reportId = "report";

    val canvas = _pdf.canvas(pdfPDFDocument,1);
    canvas.rectangle(0.toDouble(), 37.toDouble(), width , 485.toDouble());
    canvas.setColor(_pdf.color("#f8f7f7"), true);
    canvas.fill();
    canvas.stroke();


    //val rectangle = new Rectangle(36, 650, 100, 100);

    pdfDocument.add(
        _pdf.image(_storage.filesystem("server", "samples/export-pdf", "tiina.png"))
            .scaleAbsolute(120.toFloat(), 36.toFloat())
    );


    //Top Table - header
    val header = _pdf.table(twoColumnWidths);

    //FROM CELL
    val from = _pdf.cell().setBorder(_pdf.border("no-border"));

    from
    .add(_pdf.paragraph("\n")
    ).add(
        _pdf.paragraph("Bodylanguage")
            .setFont(title)
            .setFontSize(textSize)
            .setFontColor(textColor)
    ).add(
        _pdf.paragraph("Rua Infante D. Pedro 1 3º ESQ")
            .setFont(text)
            .setFontSize(textSize)
            .setFontColor(textColor)
    ).add(
        _pdf.paragraph("2835-218 Almada")
            .setFont(text)
            .setFontSize(textSize)
            .setFontColor(textColor)
    ).add(
        _pdf.paragraph("Portugal")
            .setFont(text)
            .setFontSize(textSize)
            .setFontColor(textColor)
    ).add(
        _pdf.paragraph("VAT: ")
            .setFont(text)
            .setFontSize(textSize)
            .setFontColor(textColor)
            .add( 
                _pdf.paragraph("123456789")
                .setFont(text)
                .setFontSize(textSize)
                .setFontColor(textColor)
            )
    );

    header.addCell(from);

    // TO CELL
    val to = _pdf.cell().setBorder(_pdf.border("no-border"));

    to
    .add(_pdf.paragraph("\n")
    ).add(
        _pdf.paragraph("Kelly Family")
            .setFont(title)
            .setFontSize(textSize)
            .setFontColor(textColor)
    ).add(
        _pdf.paragraph("VAT: ")
            .setFont(text)
            .setFontSize(textSize)
            .setFontColor(textColor)
            .add( 
                _pdf.paragraph("123456789")
                .setFont(text)
                .setFontSize(textSize)
                .setFontColor(textColor)
            )
    ).add(
        _pdf.paragraph("Av. Infante D. Pedro 66 5º ESQ")
            .setFont(text)
            .setFontSize(textSize)
            .setFontColor(textColor)
    ).add(
        _pdf.paragraph("1050-081 Lisboa")
            .setFont(text)
            .setFontSize(textSize)
            .setFontColor(textColor)
    ).add(
        _pdf.paragraph("Portugal")
            .setFont(text)
            .setFontSize(textSize)
            .setFontColor(textColor)
    );
    header.addCell(to);


    // Reference Cell
    val reference = _pdf.cell().setBorder(_pdf.border("no-border"));
    reference.add( _pdf.paragraph("\n")
    ).add(
        _pdf.paragraph("Reference: ")
            .setFont(title)
            .setFontSize(smallSize)
            .setFontColor(lightTextColor)
            .add( 
                _pdf.paragraph("Fitness services")
                .setFont(text)
                .setFontSize(smallSize)
                .setFontColor(textColor)
            )
    ).add(
        _pdf.paragraph("Billing Period: ")
            .setFont(title)
            .setFontSize(smallSize)
            .setFontColor(lightTextColor)
            .add( 
                _pdf.paragraph("2022-03-01 - 2022-03-31")
                .setFont(text)
                .setFontSize(smallSize)
                .setFontColor(textColor)
            )
    ).add( _pdf.paragraph("\n")
    ).add( _pdf.paragraph("\n"));
    header.addCell(reference);

    // Reference Cell
    val processed = _pdf.cell().setBorder(_pdf.border("no-border"));
    val current = java.time.LocalDateTime.now()
    val formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
    val formatted = current.format(formatter);

    processed.add( _pdf.paragraph("\n").setFontSize(smallSize)
    ).add( _pdf.paragraph("\n").setFontSize(smallSize)
    ).add( _pdf.paragraph("\n").setFontSize(smallSize)
    ).add(
        _pdf.paragraph("Processed at: ")
            .setFont(title)
            .setFontSize(smallSize)
            .setFontColor(lightTextColor)
            .add( 
                _pdf.paragraph("$formatted")
                .setFont(text)
                .setFontSize(smallSize)
                .setFontColor(textColor)
                .setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER)
            )
    );


    header.addCell(processed);
    pdfDocument.add(header);


    //Service Table - Body

    val body = _pdf.table(twoSameColumnWidths);


    //Invoice CELL
    val invoice = _pdf.cell().setBorder(_pdf.border("no-border"));

    invoice.add(
        _pdf.paragraph("INVOICE ")
            .setFont(title)
            .setFontSize(titleSize)
            .setFontColor(textColor)
    ).add(
        _pdf.paragraph("Invoice nº 1234")
            .setFont(title)
            .setFontSize(textSize)
            .setFontColor(textColor)
    );

    body.addCell(invoice);

    val services = _pdf.cell().setBorder(_pdf.border("no-border"));
    services.add( _pdf.paragraph("\n")
    ).add(
        _pdf.paragraph("Detail of the services rendered, which are included in this invoice:")
            .setFont(text)
            .setFontSize(smallSize)
            .setFontColor(textColor)
    ).add( _pdf.paragraph("\n")
    ).add(
        _pdf.table(treeOfSixColumnWidths)
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("Qty")
                        .setFont(title)
                        .setFontSize(smallSize)
                        .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#827878"), 0.5F))

            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("Description")
                            .setFont(title)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("Price")
                            .setFont(title)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("4")
                            .setFont(text)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#dddada"), 0.5F))
            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("Conversation")
                            .setFont(text)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#dddada"), 0.5F))
            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("20€")
                            .setFont(text)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#dddada"), 0.5F))
            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("8")
                            .setFont(text)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#dddada"), 0.5F))
            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("Class")
                            .setFont(text)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#dddada"), 0.5F))
            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("25€")
                            .setFont(text)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#dddada"), 0.5F))
            )

            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("1")
                            .setFont(text)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#dddada"), 0.5F))
            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("Text Correction")
                            .setFont(text)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#dddada"), 0.5F))
            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("10€")
                            .setFont(text)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#dddada"), 0.5F))
            )
    ).add( _pdf.paragraph("\n")
    ).add(
        _pdf.table(treeOfSixColumnWidths)
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("Total")
                        .setFont(title)
                        .setFontSize(smallSize)
                        .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border"))
                    .setBorderTop(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
                    .setBorderBottom(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("")
                        .setFont(title)
                        .setFontSize(smallSize)
                        .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border"))
                    .setBorderTop(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
                    .setBorderBottom(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("55€")
                        .setFont(title)
                        .setFontSize(smallSize)
                        .setFontColor(textColor)
                    ).setBorder(_pdf.border("no-border"))
                    .setBorderTop(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
                    .setBorderBottom(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
            )
    ).add( _pdf.paragraph("\n")
    ).add( _pdf.paragraph("\n")
    ).add( 
        _pdf.paragraph("Terms: ")
            .setFont(title)
            .setFontSize(smallSize)
            .setFontColor(textColor)
    ).add( 
        _pdf.paragraph(" - Invoice need to be paid in 30 days ")
            .setFont(text)
            .setFontSize(smallSize)
            .setFontColor(textColor)
    ).add( 
        _pdf.paragraph(" - Transaction expenses will be paid by the issuer ")
            .setFont(text)
            .setFontSize(smallSize)
            .setFontColor(textColor)
    )
    body.addCell(services);
    pdfDocument.add(body);

    //Footer
    pdfDocument.add(
        _pdf.table(treeColumnWidths)
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("Company: ")
                        .setFont(text)
                        .setFontSize(smallSize)
                        .setFontColor(lightTextColor)
                        .setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER)
                        .add( 
                            _pdf.paragraph("Bodylanguage")
                            .setFont(text)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                        )
                        
                    ).setBorder(_pdf.border("no-border"))
                    .setBorderTop(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("Phone: ")
                        .setFont(text)
                        .setFontSize(smallSize)
                        .setFontColor(lightTextColor)
                        .setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER)
                        .add( 
                            _pdf.paragraph("+351 969 696 966")
                            .setFont(text)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                        )
                    ).setBorder(_pdf.border("no-border"))
                    .setBorderTop(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
            )
            .addCell(
                _pdf.cell()
                    .add(
                        _pdf.paragraph("Email: ")
                        .setFont(text)
                        .setFontSize(smallSize)
                        .setFontColor(lightTextColor)
                        .setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER)
                        .add( 
                            _pdf.paragraph("info@bodylanguage.coach")
                            .setFont(text)
                            .setFontSize(smallSize)
                            .setFontColor(textColor)
                        )
                    ).setBorder(_pdf.border("no-border"))
                    .setBorderTop(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
            ).setFixedPosition(0.toFloat(), 5.toFloat(), width.toFloat())


    )


    pdfDocument.close();
    //return pdfDocument.toByteArray();
}