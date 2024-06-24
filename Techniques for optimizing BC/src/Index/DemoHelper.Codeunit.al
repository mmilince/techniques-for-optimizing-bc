codeunit 50102 "Demo Helper"
{

    procedure InsertDemos()
    var
        i: Integer;
        StartTime: DateTime;
        EndTime: DateTime;
    begin
        InsertCars();

        StartTime := CurrentDateTime;
        for i := 1 to 5000000 do begin
            InsertDemo();
        end;

        EndTime := CurrentDateTime;
        Message(Format(EndTime - StartTime));
    end;

    procedure InsertTotals()
    var
        CarTotal: Record "Car Total";
        Car: Record Car;
    begin
        if not CarTotal.IsEmpty() then
            CarTotal.DeleteAll();

        if Car.FindSet() then
            repeat
                CarTotal.Init();
                CarTotal."Entry No." := Car."No.";
                CarTotal."Car No." := Car."No.";
                CarTotal."Car Name" := Car.Name;
                CarTotal.Insert(true);
            until Car.Next() = 0;
    end;

    local procedure InsertCars()
    begin
        InsertCar('Abarth');
        InsertCar('Acura');
        InsertCar('Alfa Romeo');
        InsertCar('Aprilia');
        InsertCar('Arch Motorcycle');
        InsertCar('Ashok Leyland');
        InsertCar('Aston Martin');
        InsertCar('Audi');
        InsertCar('Automobile Dacia');
        InsertCar('AvtoVAZ');
        InsertCar('Bajaj');
        InsertCar('Benelli');
        InsertCar('Bentley');
        InsertCar('BharatBenz');
        InsertCar('BMW');
        InsertCar('Buell Motorcycle');
        InsertCar('Bugatti');
        InsertCar('BYD Auto');
        InsertCar('Cadillac');
        InsertCar('CFMoto');
        InsertCar('Changan Automobile');
        InsertCar('Chery Automobile');
        InsertCar('Chevrolet');
        InsertCar('Chrysler');
        InsertCar('Citroen');
        InsertCar('Daewoo');
        InsertCar('Daihatsu');
        InsertCar('Datsun');
        InsertCar('Dodge');
        InsertCar('DS Automobiles');
        InsertCar('Ducati');
        InsertCar('Eicher Motors');
        InsertCar('Ferrari');
        InsertCar('Fiat');
        InsertCar('Force Motors');
        InsertCar('Ford');
        InsertCar('Geely');
        InsertCar('GMC');
        InsertCar('Harley Davidson');
        InsertCar('Hero Moto Corp');
        InsertCar('Holden');
        InsertCar('Honda');
        InsertCar('Husqvarna');
        InsertCar('Hyundai');
        InsertCar('Indian Motorcycle');
        InsertCar('Infiniti');
        InsertCar('Isuzu Motors');
        InsertCar('JAC Motors');
        InsertCar('Jaguar');
        InsertCar('Janus Motorcycles');
        InsertCar('Jawa Motorcycles');
        InsertCar('Jeep');
        InsertCar('Kawasaki');
        InsertCar('Kia Motors');
        InsertCar('KTM');
        InsertCar('Lada');
        InsertCar('Lamborghini');
        InsertCar('Lancia');
        InsertCar('Land Rover');
        InsertCar('Lexus');
        InsertCar('Lotus');
        InsertCar('Mahindra');
        InsertCar('Maruti Suzuki');
        InsertCar('Maserati');
        InsertCar('Maybach');
        InsertCar('Mazda');
        InsertCar('McLaren Automotive');
        InsertCar('Mercedes');
        InsertCar('Mini marque');
        InsertCar('Mitsubishi Motors');
        InsertCar('Moto Guzzi');
        InsertCar('Nissan');
        InsertCar('Norton Motorcycle');
        InsertCar('Opel');
        InsertCar('Peugeot');
        InsertCar('Piaggio');
        InsertCar('Polaris');
        InsertCar('Polestar');
        InsertCar('Porsche');
        InsertCar('Razor Motorcycle');
        InsertCar('Renault');
        InsertCar('Rolls Royce');
        InsertCar('Royal Enfield');
        InsertCar('SAIC Motor');
        InsertCar('Saleen Automotive');
        InsertCar('SEAT');
        InsertCar('Skoda Auto');
        InsertCar('Subaru');
        InsertCar('Suzuki');
        InsertCar('Tata Motors');
        InsertCar('Tesla');
        InsertCar('Toyota');
        InsertCar('Triumph');
        InsertCar('TVS');
        InsertCar('UAZ');
        InsertCar('Vauxhall');
        InsertCar('Vespa');
        InsertCar('Victory Motorcycle');
        InsertCar('Volkswagen');
        InsertCar('Volvo');
        InsertCar('W Motors');
        InsertCar('Yamaha');
        InsertCar('Zero Motorcycle');
        InsertCar('Zenvo Automotive');
        InsertCar('Zundapp Janus');
    end;

    local procedure InsertCar(Name: Text[50])
    var
        Car: Record Car;
    begin
        Car.Init();
        Car.Name := Name;
        Car.Insert(true);
    end;

    local procedure InsertDemo()
    var
        Demo: Record "Demo";
    begin
        Demo.Init();
        Demo.Description := StrSubstNo('Demo description %1', Demo."Entry No.");
        SelectAmount(Demo);
        SelectCar(Demo);
        Demo.Insert(true);
    end;

    local procedure SelectAmount(var Demo: Record "Demo")
    begin
        Demo.Amount := Random(1000);
        Demo."Amount 2" := Demo.Amount;
    end;

    local procedure SelectCar(var Demo: Record "Demo")
    begin
        Demo."Car No." := Random(105);
    end;

    #region 1000
    procedure Insert1000()
    var
        StartTime: DateTime;
        Endtime: DateTime;
        Demo: Record "Demo";
        I: Integer;
    begin
        StartTime := CurrentDateTime;
        for I := 1 to 1000 do begin
            InsertDemo();
        end;

        EndTime := CurrentDateTime;
        Message(Format(EndTime - StartTime));
    end;

    procedure Modify1000()
    var
        StartTime: DateTime;
        Endtime: DateTime;
        Demo: Record Demo;
    begin
        StartTime := CurrentDateTime;

        Demo.SetRange("Entry No.", 1000, 2000);
        Demo.ModifyAll(Description, 'Modified Description', false);

        EndTime := CurrentDateTime;
        Message(Format(EndTime - StartTime));
    end;

    procedure Delete1000()
    var
        StartTime: DateTime;
        Endtime: DateTime;
        Demo: Record "Demo";
    begin
        StartTime := CurrentDateTime;

        Demo.SetRange("Entry No.", 1000000, 1001000);
        Demo.DeleteAll();

        EndTime := CurrentDateTime;
        Message(Format(EndTime - StartTime));
    end;
    #endregion 1000
}