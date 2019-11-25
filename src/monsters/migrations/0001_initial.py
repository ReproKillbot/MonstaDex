# Generated by Django 2.2.4 on 2019-11-25 02:38

from django.db import migrations, models
import django.db.models.deletion
import modelcluster.fields
import sorl.thumbnail.fields
import wagtail.core.fields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('wagtailcore', '0041_group_collection_permissions_verbose_name_plural'),
    ]

    operations = [
        migrations.CreateModel(
            name='MonsterHomePage',
            fields=[
                ('page_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
            ],
            options={
                'abstract': False,
            },
            bases=('wagtailcore.page',),
        ),
        migrations.CreateModel(
            name='Monster',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sort_order', models.IntegerField(blank=True, editable=False, null=True)),
                ('monsterName', models.CharField(max_length=50)),
                ('family', models.CharField(choices=[('Normal', 'Normal'), ('Undead', 'Undead'), ('Beast', 'Beast'), ('Construct', 'Construct'), ('Dragon', 'Dragon')], max_length=30)),
                ('element', models.CharField(choices=[('Air', 'Air'), ('Arcane', 'Arcane'), ('Earth', 'Earth'), ('Fire', 'Fire'), ('Dark', 'Dark'), ('Light', 'Light'), ('Omni', 'Omni'), ('Water', 'Water')], max_length=30)),
                ('image', sorl.thumbnail.fields.ImageField(upload_to='')),
                ('description', wagtail.core.fields.RichTextField(default='')),
                ('page', modelcluster.fields.ParentalKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='monsters', to='monsters.MonsterHomePage')),
            ],
            options={
                'ordering': ['sort_order'],
                'abstract': False,
            },
        ),
    ]