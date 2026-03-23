CREATE TABLE Patients (
    Username TEXT PRIMARY KEY,
    Salt BLOB NOT NULL,
    Hash BLOB NOT NULL
);

CREATE TABLE Caregivers (
    Username TEXT PRIMARY KEY,
    Salt BLOB NOT NULL,
    Hash BLOB NOT NULL
);

CREATE TABLE Vaccines (
    Name TEXT PRIMARY KEY,
    Doses INTEGER NOT NULL
);

CREATE TABLE Availabilities (
    Username TEXT,
    Time DATE,
    PRIMARY KEY (Username, Time),
    FOREIGN KEY (Username) REFERENCES Caregivers(Username)
);

CREATE TABLE Reservations (
    ReservationID INTEGER PRIMARY KEY AUTOINCREMENT,
    Patient TEXT,
    Caregiver TEXT,
    Vaccine TEXT,
    Time DATE,
    FOREIGN KEY (Patient) REFERENCES Patients,
    FOREIGN KEY (Caregiver) REFERENCES Caregivers,
    FOREIGN KEY (Vaccine) REFERENCES Vaccines
);