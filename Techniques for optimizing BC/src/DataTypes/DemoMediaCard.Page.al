page 50100 "Demo Media Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Demo Media";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }

        area(FactBoxes)
        {
            part("Demo Image"; "Demo Image")
            {
                SubPageLink = "Entry No." = field("Entry No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportPicture)
            {
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a picture file.';
                ApplicationArea = All;

                trigger OnAction()
                var
                    FileManagement: Codeunit "File Management";
                    TempBlob: Codeunit "Temp Blob";
                    InStr: InStream;
                    FileName: Text;
                begin
                    FileName := FileManagement.BLOBImport(TempBlob, '');
                    if FileName = '' then
                        exit;

                    TempBlob.CreateInStream(InStr);
                    Rec.Image.ImportStream(InStr, FileName);
                    Rec.Modify(true);
                end;
            }

            action(Orphaned)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Orphans: List of [Guid];
                    OrphanId: Guid;
                begin
                    Orphans := Media.FindOrphans();

                    foreach OrphanId in Orphans do begin
                        Message(OrphanId);
                    end;
                end;
            }
        }
    }
}