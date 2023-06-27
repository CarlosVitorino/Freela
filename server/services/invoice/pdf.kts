
/**
 *
 *  EN: Export PDF
 *  EN: Generates a PDF file in realtime showing some kind of content features.
 *
 *  PT: Export PDF
 *  PT: Gera um ficheiro PDF em tempo real mostrando alguns tipos de recursos de conteúdo.
 *
 */
_header.contentType("pdf");

val user = _user.id();
/*Fetch Data */
val invoice_id = _req.getString("id");
val invoice_new = _db.get("finance", invoice_id);
_log.info(invoice_new.toJSON());
val sessionsIds = invoice_new.getString("sessions");
val sanitezedSessionsIds = _db.sanitize(sessionsIds);
val sessions = _db.query("SELECT count(s.*) as qty, s.price, sst.label as description FROM session s inner join session_sub_type sst on s.sub_type_id = sst.id WHERE s.id IN (${sanitezedSessionsIds}) AND s.client_user_id = ${user} group by sst.label, s.price ");
val client = _db.get("client", invoice_new.getInt("client_id"));
val company = _db.findFirst(
    "company",
    _val.map()
        .set(
            "where",
            _val.map()
                .set("client_user_id", invoice_new.getInt("client_user_id"))
        )
)
_log.info("client: " + client.toJSON());

/* Company Data */
val company_name = if (company.getString("company") !== null) company.getString("company") else "";
val address = if (company.getString("address") !== null) company.getString("address") else "";
val city = if (company.getString("city") !== null) company.getString("city") else "";
val postal_code = if (company.getString("postal_code") !== null) company.getString("postal_code") else "";
val country = if (company.getString("country") !== null) company.getString("country") else "";
val vat = if (company.getString("vat") !== null) company.getString("vat") else "";
val terms = if (company.getString("terms") !== null) company.getString("terms") else "";
val phone_number = if (company.getString("phone_number") !== null) company.getString("phone_number") else "";
val email = if (company.getString("email") !== null) company.getString("email") else "";

/* Client Data */
val client_name = if (client.getString("legal_name") !== null) client.getString("legal_name") else client.getString("name");
val client_address = if (client.getString("address") !== null) client.getString("address") else "";
val client_city = if (client.getString("city") !== null) client.getString("city") else "";
val client_postal_code = if (client.getString("postal_code") !== null) client.getString("postal_code") else "";
val client_country = if (client.getString("country") !== null) client.getString("country") else "";
val client_vat = if (client.getString("vat") !== null) client.getString("vat") else ""; 

/* Invoice Data */
val billing_period = if (invoice_new.getString("billing_period") !== null) invoice_new.getString("billing_period") else "";
val processed_at = if (invoice_new.getString("created_at") !== null) invoice_new.getString("created_at") else "";
val total_amount = if (invoice_new.getString("total_amount") !== null) invoice_new.getString("total_amount") else "";
val service_description = if (invoice_new.getString("service_description") !== null) invoice_new.getString("service_description") else "";
val invoice_number = if (invoice_new.getString("id") !== null) invoice_new.getString("id") else "";
/* Sessions List logging */
for (session in sessions) {
    _log.info(session.toJSON());
}



/* Generate PDF */


val pdfDocument = _pdf.newDocument(_pdf.pageSize("A4"));
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
//val pdfDocument = _pdf.newDocument( _storage.filesystem("private", "finance", "report.pdf"), _pdf.pageSize("A4"));


val canvas = _pdf.canvas(pdfPDFDocument,1);
canvas.rectangle(0.toDouble(), 37.toDouble(), width , 485.toDouble());
canvas.setColor(_pdf.color("#f8f7f7"), true);
canvas.fill();
canvas.stroke();


//val rectangle = new Rectangle(36, 650, 100, 100);

pdfDocument.add(
    _pdf.image(_storage.database("company", "logo", company.getString("logo")))
        .scaleAbsolute(120.toFloat(), 36.toFloat())
);


//Top Table - header
val header = _pdf.table(twoColumnWidths);


//FROM CELL
val from = _pdf.cell().setBorder(_pdf.border("no-border"));

from
.add(_pdf.paragraph("\n")
).add(
    _pdf.paragraph(company_name)
        .setFont(title)
        .setFontSize(textSize)
        .setFontColor(textColor)
).add(
    _pdf.paragraph(address)
        .setFont(text)
        .setFontSize(textSize)
        .setFontColor(textColor)
).add(
    _pdf.paragraph(postal_code + " " +  city)
        .setFont(text)
        .setFontSize(textSize)
        .setFontColor(textColor)
).add(
    _pdf.paragraph(country)
        .setFont(text)
        .setFontSize(textSize)
        .setFontColor(textColor)
).add(
    _pdf.paragraph("VAT: ")
        .setFont(text)
        .setFontSize(textSize)
        .setFontColor(textColor)
        .add( 
            _pdf.paragraph(vat)
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
    _pdf.paragraph(client_name)
        .setFont(title)
        .setFontSize(textSize)
        .setFontColor(textColor)
).add(
    _pdf.paragraph("VAT: ")
        .setFont(text)
        .setFontSize(textSize)
        .setFontColor(textColor)
        .add( 
            _pdf.paragraph(client_vat)
            .setFont(text)
            .setFontSize(textSize)
            .setFontColor(textColor)
        )
).add(
    _pdf.paragraph(client_address)
        .setFont(text)
        .setFontSize(textSize)
        .setFontColor(textColor)
).add(
    _pdf.paragraph(client_postal_code + " " +  client_city)
        .setFont(text)
        .setFontSize(textSize)
        .setFontColor(textColor)
).add(
    _pdf.paragraph(client_country)
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
            _pdf.paragraph(service_description)
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
            _pdf.paragraph(billing_period)
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
            _pdf.paragraph(processed_at)
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
    _pdf.paragraph("Invoice nº " + invoice_number)
        .setFont(title)
        .setFontSize(textSize)
        .setFontColor(textColor)
);

body.addCell(invoice);

val pdfTable = _pdf.table(treeOfSixColumnWidths)
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
for (session in sessions) {
    pdfTable.addCell(
        _pdf.cell()
            .add(
                _pdf.paragraph(session.getString("qty"))
                    .setFont(text)
                    .setFontSize(smallSize)
                    .setFontColor(textColor)
            ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
    ).addCell(
        _pdf.cell()
            .add(
                _pdf.paragraph(session.getString("description"))
                    .setFont(text)
                    .setFontSize(smallSize)
                    .setFontColor(textColor)
            ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
    ).addCell(
        _pdf.cell()
            .add(
                _pdf.paragraph(session.getString("price") + "€")
                    .setFont(text)
                    .setFontSize(smallSize)
                    .setFontColor(textColor)
            ).setBorder(_pdf.border("no-border")).setBorderBottom(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
    )
}

val services = _pdf.cell().setBorder(_pdf.border("no-border"));
services.add( _pdf.paragraph("\n")
).add(
    _pdf.paragraph("Detail of the services rendered, which are included in this invoice:")
        .setFont(text)
        .setFontSize(smallSize)
        .setFontColor(textColor)
).add( _pdf.paragraph("\n")
).add(
    pdfTable
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
                    _pdf.paragraph(total_amount + "€")
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
    _pdf.paragraph(terms)
        .setFont(text)
        .setFontSize(smallSize)
        .setFontColor(textColor)
)/* .add( 
    _pdf.paragraph(" - Transaction expenses will be paid by the issuer ")
        .setFont(text)
        .setFontSize(smallSize)
        .setFontColor(textColor)
) */
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
                        _pdf.paragraph(company_name)
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
                        _pdf.paragraph(phone_number)
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
                        _pdf.paragraph(email)
                        .setFont(text)
                        .setFontSize(smallSize)
                        .setFontColor(textColor)
                    )
                ).setBorder(_pdf.border("no-border"))
                .setBorderTop(_pdf.border("solid", _pdf.color("#827878"), 0.5F))
        ).setFixedPosition(0.toFloat(), 5.toFloat(), width.toFloat())


)


pdfDocument.close();
