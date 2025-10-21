#ifndef MAIN_VIEW_H
#define MAIN_VIEW_H

#include <QWidget>
#include <QVBoxLayout>
#include <QGridLayout>
#include <QStackedWidget>

// UI-DS компоненты
#include <ui_ds/controls/molecules/label/label.h>
#include <ui_ds/controls/molecules/buttons/primary_button.h>
#include <ui_ds/controls/molecules/buttons/secondary_button.h>
#include <ui_ds/controls/molecules/input/input.h>
#include <ui_ds/controls/organisms/combobox/combobox.h>
#include <ui_ds/atoms/colors/theme_manager.h>
#include <ui_ds/atoms/colors/defines.h>

using namespace ui::ds::controls::molecules;
using namespace ui::ds::controls::molecules::buttons;
using namespace ui::ds::controls::organisms::combobox;
using namespace ui::ds::atoms::colors;
using namespace ui::ds::atoms::colors::defines;

class MainView : public QWidget
{
    Q_OBJECT

public:
    explicit MainView(QWidget *parent = nullptr);

private slots:
    void onThemeChanged(TThemeName themeName);

private:
    void setupUI();
    void setupConnections();
    void initColorGroups();
    void initColorGroup(const QString& groupName, const QVector<QPair<QString, QColor>>& colors);

    // указатели на UI элементы
    Input *m_input;
    PrimaryButton *m_primaryButton;
    SecondaryButton *m_secondaryButton;
    Label *m_resultLabel;
    Combobox *m_themeComboBox;
    Combobox *m_colorGroupComboBox;
    QStackedWidget *m_colorStack;
};

#endif // MAIN_VIEW_H