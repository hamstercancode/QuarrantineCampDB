# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Assign(models.Model):
    room_id = models.ForeignKey('Room', models.DO_NOTHING, db_column='Room id', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    floor_number = models.ForeignKey('Room', models.DO_NOTHING, db_column='Floor number', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    building_id = models.ForeignKey('Room', models.DO_NOTHING, db_column='Building id', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    staff_id = models.ForeignKey('Staff', models.DO_NOTHING, db_column='Staff id', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    patient_number = models.OneToOneField('Patient', models.DO_NOTHING, db_column='Patient number', primary_key=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'Assign'

class Doctor(models.Model):
    id = models.OneToOneField('People', models.DO_NOTHING, db_column='ID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Doctor'


class HeadDoctor(models.Model):
    id = models.OneToOneField('People', models.DO_NOTHING, db_column='ID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Head doctor'


class LocationHistory(models.Model):
    patient_number = models.ForeignKey('Patient', models.DO_NOTHING, db_column='Patient number', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    locations = models.CharField(db_column='Locations', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Location History'


class Manager(models.Model):
    id = models.OneToOneField('People', models.DO_NOTHING, db_column='ID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Manager'


class Medication(models.Model):
    unique_code = models.AutoField(db_column='Unique code', primary_key=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    name = models.CharField(db_column='Name', max_length=50)  # Field name made lowercase.
    effect = models.CharField(db_column='Effect', max_length=50, blank=True, null=True)  # Field name made lowercase.
    price = models.DecimalField(db_column='Price', max_digits=19, decimal_places=4)  # Field name made lowercase.
    expdate = models.DateField(db_column='Expdate')  # Field name made lowercase.
    patient_number = models.ForeignKey('Patient', models.DO_NOTHING, db_column='Patient number')  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'Medication'


class Nurse(models.Model):
    id = models.OneToOneField('People', models.DO_NOTHING, db_column='ID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Nurse'


class Patient(models.Model):
    identity_number = models.IntegerField(db_column='Identity number', unique=True, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    unique_number = models.AutoField(db_column='Unique number', primary_key=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    full_name = models.CharField(db_column='Full name', max_length=25)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    phone = models.CharField(db_column='Phone', max_length=10, blank=True, null=True)  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=50, blank=True, null=True)  # Field name made lowercase.
    discharge_date = models.DateField(db_column='Discharge date', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    nurses_id = models.ForeignKey(Nurse, models.DO_NOTHING, db_column='Nurses id')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    delivered_from = models.CharField(db_column='Delivered from', max_length=50, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    admission_date = models.DateField(db_column='Admission date')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    commorbidities = models.CharField(db_column='Commorbidities', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Patient'


class People(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    full_name = models.CharField(db_column='Full name', max_length=25)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    gender = models.CharField(db_column='Gender', max_length=1, blank=True, null=True)  # Field name made lowercase.
    phone = models.CharField(db_column='Phone', max_length=10, blank=True, null=True)  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'People'


class Room(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    capacity = models.IntegerField(db_column='Capacity')  # Field name made lowercase.
    type = models.CharField(db_column='Type', max_length=12, blank=True, null=True)  # Field name made lowercase.
    floor_number = models.IntegerField(db_column='Floor number')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    building_id = models.CharField(db_column='Building id', max_length=5)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'Room'
        unique_together = (('id', 'floor_number', 'building_id'),)


class Staff(models.Model):
    id = models.OneToOneField(People, models.DO_NOTHING, db_column='ID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Staff'


class Tests(models.Model):
    date = models.DateField(db_column='Date', blank=True, null=True)  # Field name made lowercase.
    pcr_test = models.CharField(db_column='PCR test', max_length=10, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    quick_test = models.CharField(db_column='Quick test', max_length=10, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    spo2 = models.IntegerField(db_column='SPO2', blank=True, null=True)  # Field name made lowercase.
    respiratory = models.CharField(db_column='Respiratory', max_length=50, blank=True, null=True)  # Field name made lowercase.
    warning = models.CharField(db_column='Warning', max_length=10, blank=True, null=True)  # Field name made lowercase.
    ct_value = models.IntegerField(db_column='CT value', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    patient_number = models.ForeignKey(Patient, models.DO_NOTHING, db_column='Patient number', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'Tests'


class Track(models.Model):
    symptom = models.CharField(db_column='Symptom', max_length=50, blank=True, null=True)  # Field name made lowercase.
    date = models.DateField(db_column='Date', blank=True, null=True)  # Field name made lowercase.
    patient_number = models.ForeignKey(Patient, models.DO_NOTHING, db_column='Patient number', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'Track'


class Treat(models.Model):
    doctor_id = models.OneToOneField(Doctor, models.DO_NOTHING, db_column='Doctor id', primary_key=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    patient_number = models.ForeignKey(Patient, models.DO_NOTHING, db_column='Patient number')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    start_date = models.DateField(db_column='Start date')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    end_date = models.DateField(db_column='End date', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    result = models.CharField(db_column='Result', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Treat'
        unique_together = (('doctor_id', 'patient_number'),)


class Volunteer(models.Model):
    id = models.OneToOneField(People, models.DO_NOTHING, db_column='ID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Volunteer'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DashboardTreat(models.Model):
    start_date = models.DateField(db_column='Start date')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    end_date = models.DateField(db_column='End date', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    result = models.CharField(db_column='Result', max_length=50, blank=True, null=True)  # Field name made lowercase.
    patient_number = models.ForeignKey(Patient, models.DO_NOTHING, db_column='Patient number')  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'dashboard_treat'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'